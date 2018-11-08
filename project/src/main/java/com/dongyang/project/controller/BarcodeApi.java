package com.dongyang.project.controller;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.activation.MimetypesFileTypeMap;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dongyang.project.domain.ImageVO;
import com.dongyang.project.domain.LoginVO;
import com.dongyang.project.domain.ProductVO;
import com.dongyang.project.service.LoginService;

@Controller
public class BarcodeApi {
	public static Locale default_locale = Locale.getDefault();
	public static SimpleDateFormat default_format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", default_locale);
	@Inject
	private LoginService service;
	//회원가입
	@RequestMapping(value="/Sigin",method = RequestMethod.POST)
	public JSONObject insertManager(HttpServletResponse response, HttpServletRequest request,LoginVO login) throws Exception{
		response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        JSONObject jResponse = new JSONObject();
        String uid = request.getParameter("uid");
        String upw = request.getParameter("upw");
        String name = request.getParameter("name");
        String site = request.getParameter("site");
        LoginVO bean = service.select(uid);
        if(null != bean) {
        	jResponse.put("error", "1");
        	jResponse.put("message", "중복된 아이디입니다.");
        }else {
        	//테스트
        	LoginVO vo = new LoginVO();
        	vo.setMid(uid);
        	vo.setMpw(upw);
        	vo.setName(name);
        	vo.setSite_tid(site);
        	
        	vo.setCreate_date(default_format.format(new Date()));
        	if(0 < service.insert(vo)) {
             	jResponse.put("error", "0");
            	jResponse.put("message", "성공하셨습니다.");
        	}
        }
        jResponse.write(out);
        out.close();
        return jResponse;
	}
	@RequestMapping(value="/Login",method = RequestMethod.POST)
	public JSONObject loginManager(HttpServletResponse response, HttpServletRequest request,LoginVO login) throws Exception{
		response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        JSONObject jResponse = new JSONObject();
        String uid = request.getParameter("uid");
        String upw = request.getParameter("upw");
        LoginVO bean = service.select(uid);
        if(null != bean) {
			if(upw.equals(bean.getMpw())) {
				jResponse.put("mid", bean.getMid());
				jResponse.put("name", bean.getName());
	        	jResponse.put("error", "0");
	        	jResponse.put("message", "성공하셨습니다.");
			}else{
	        	jResponse.put("error", "1");
	        	jResponse.put("message", "비밀번호가 틀립니다.");
			}
        }else {
        	jResponse.put("error", "1");
        	jResponse.put("message", "ID가 존재하지않습니다.");
        }
        jResponse.write(out);
        out.close();
        return jResponse;
	}
	@RequestMapping(value="/Image",method = RequestMethod.POST)
	public JSONObject ImageManager(HttpServletResponse response, HttpServletRequest request,LoginVO login) throws Exception{
		response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        JSONObject jResponse = new JSONObject();
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String count = request.getParameter("count");
        HashMap<String, Object> parameterMap = new HashMap<>();
        ArrayList<FileItem> multipartParameter = new ArrayList<>();
        if (ServletFileUpload.isMultipartContent(request)) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setHeaderEncoding("UTF-8");
            List items = null;
            try {
                items = upload.parseRequest(request);
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
            Iterator itr = items.iterator();
            while (itr.hasNext()) {
                FileItem item = (FileItem) itr.next();
                if (item.isFormField()) {
                    try {
                        String value = item.getString("UTF-8");
                        parameterMap.put(item.getFieldName(), value);
                    } catch (UnsupportedEncodingException ex) {
                        ex.printStackTrace();
                    }
                } else {//file field
                    multipartParameter.add(item);
                }
            }
            title = (String) parameterMap.get("title");
            content = (String) parameterMap.get("content");
            count = (String) parameterMap.get("count");
        }
        if (title.isEmpty()&& content.isEmpty()) {
            jResponse.put("error", 1);
            jResponse.put("message", "invail params");
        } else {
            try {
                FileItem file = null;
                if (multipartParameter.size() > 0) {
                    file = multipartParameter.get(0);
                }
               
                ImageVO vo = new ImageVO();
                vo.setContent(file.getInputStream().toString());
                vo.setFileName(file.getName());
                vo.setMimeType(file.getContentType());
                service.insertImage(vo);
                ProductVO tid = service.nextTid();
                String proTid = "";
                if(null != tid) {
                	if(tid.getTid().length() < 4) {
                		for(int i =0; i< (4 - tid.getTid().length()); i++) {
                			proTid += "0";
                		}
                		proTid += tid.getTid();
                	}
                }
                ProductVO pro = new ProductVO();
                String code = "88000001"+proTid;
                ArrayList<String> a = new ArrayList<String>();
                int oddNum = 0;
                int evenNum = 0;
                for(int i = 0; i < code.length(); i++) {
                	if(11 == i) {
                		a.add(code.substring(i,code.length()));
                	}else {
                		a.add(code.substring(i,i+1));	
                	}
                }
                for(int i = 0; i < a.size(); i++) {
                	int c = i+1;
                	if(c % 2 == 0) {
                		evenNum += Integer.parseInt(a.get(i));
                	}else {
                		oddNum += Integer.parseInt(a.get(i));
                	}
                }
                int ean = (10 - (oddNum + 3*(evenNum))%10)%10;
                String ean13 = String.valueOf(ean); 
                pro.setName(title);
                pro.setPrice(content);
                pro.setCount(count);
                pro.setBarcode("88000001"+proTid+ean13);
                service.insertPro(pro);
                //13자리의 숫자 바코드 생성
                //처음 3자리 국가코드 880(한국)
                //두번째 5자리 공장
                //그다음 4자리 상품번호
                //마지막 체크 디지트
            } catch (ClassNotFoundException ex) {
                jResponse.put("error", 1);
                jResponse.put("message", "classNotFoundException " + ex);
            } catch (SQLException ex) {
                jResponse.put("error", 1);
                jResponse.put("message", "sQLException" + ex);
            }
            jResponse.put("error", 0);
            jResponse.put("result", new JSONObject());

        }
        jResponse.write(out);
        out.close();
        return jResponse;
    }
	public String convertStreamToString(InputStream is) throws IOException {
		/* * To convert the InputStream to String we use the * Reader.read(char[] buffer) method. We iterate until the * Reader return -1 which means there's no more data to * read. We use the StringWriter class to produce the string. */ 
		if (is != null) { 
			Writer writer = new StringWriter(); 
			char[] buffer = new char[1024]; 
			try { 
				Reader reader = new BufferedReader( new InputStreamReader(is, "UTF-8")); 
				int n;
				while ((n = reader.read(buffer)) != -1) { 
					writer.write(buffer, 0, n); 
				}	
			} finally { is.close(); }
			return writer.toString(); 
		}else{ return ""; } 
	}
	
	@RequestMapping(value="/ProductList",method = RequestMethod.GET)
	public JSONObject selectProducList(HttpServletResponse response, HttpServletRequest request,ProductVO product) throws Exception{
		response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        JSONObject jResponse = new JSONObject();
        List<ProductVO> list = service.selectProduct();
        JSONArray ary = new JSONArray(); 
        if(null != list) {
        	for(int i =0; i < list.size(); i++) {
        		JSONObject obj = new JSONObject();
        		ProductVO bean = list.get(i);
        		obj.put("tid", bean.getTid());
        		obj.put("site_tid", bean.getSite_tid());
        		obj.put("image_id", bean.getImage_id());
        		obj.put("name", bean.getName());
        		obj.put("price", bean.getPrice());
        		obj.put("count", bean.getCount());
        		obj.put("barcode", bean.getBarcode());
            	ary.put(obj);
        	}
        }
        jResponse.put("error", 0);
        jResponse.put("result", ary);
        PrintWriter out = response.getWriter();
        jResponse.write(out);
        out.close();
        return jResponse;
	}
	@RequestMapping(value="/ImageView",method = RequestMethod.GET)
	public void imageView(HttpServletResponse response, HttpServletRequest request,LoginVO login) throws Exception{
		response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        ImageVO bean = service.selectImage(id);
        if(null != bean) {
        	String imageFileName = bean.getFileName();
            String imageMimeType = bean.getMimeType();

            MimetypesFileTypeMap mtftp = new MimetypesFileTypeMap();
            mtftp.addMimeTypes("image png tif jpg jpeg bmp");
            String mimeType = mtftp.getContentType(imageFileName);
            if (mimeType != null && mimeType.length() > 0) {
                response.setContentType(mimeType);
            } else if (imageMimeType != null && imageMimeType.length() > 0) {
                response.setContentType(imageMimeType);
            } else {
                response.setContentType("application/octet-stream");
            }
            byte[] bytes = bean.getContent().getBytes();

            /* String --> InputStream 타입으로 변환 */
            InputStream is = new ByteArrayInputStream(bytes);
            BufferedOutputStream os = new BufferedOutputStream(response.getOutputStream());
            int binaryRead = is.read();
            os.write(binaryRead);
            os.flush();
            os.close();
        }
	}
	@RequestMapping(value="/BarcodeInfo",method = RequestMethod.POST)
	public JSONObject imageView(HttpServletResponse response, HttpServletRequest request,ProductVO product) throws Exception{
		response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        JSONObject jResponse = new JSONObject();
        String barcode = request.getParameter("barcode");
        ProductVO bean = service.selectProductInfo(barcode);
        if(null != bean) {
			jResponse.put("name", bean.getName());
			jResponse.put("price", bean.getPrice());
			jResponse.put("count", bean.getCount());
			jResponse.put("barcode", bean.getBarcode());
			jResponse.put("image", bean.getImage_id());
        	jResponse.put("error", "0");
        	jResponse.put("message", "성공하셨습니다.");
        }else {
        	jResponse.put("error", "2");
        }
        PrintWriter out = response.getWriter();
        jResponse.write(out);
        out.close();
        return jResponse;
	}
	@RequestMapping(value="/updateProduct",method = RequestMethod.POST)
	public JSONObject updateProductOut(HttpServletResponse response, HttpServletRequest request,ProductVO product) throws Exception{
		response.setContentType("application/json; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        int result = 0;
        JSONObject jResponse = new JSONObject();
        String barcode = request.getParameter("barcode");
        String count = request.getParameter("count");
        String status = request.getParameter("status");
        ProductVO pro = new ProductVO();
        pro.setBarcode(barcode);
        pro.setCount(count);
        if("IN".equals(status)) {
        	result = service.updateProductIn(pro);
        }else {
        	result = service.updateProductOut(pro);
        }
        if(result > 0) {
        	jResponse.put("error", "0");
        	jResponse.put("message", "성공하셨습니다.");
        }else {
        	jResponse.put("error", "1");
        	jResponse.put("message", "실패했습니다.");
        }
        jResponse.write(out);
        out.close();
        return jResponse;
	}
}

