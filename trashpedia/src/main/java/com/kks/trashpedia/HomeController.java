package com.kks.trashpedia;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kks.trashpedia.trash.model.service.TrashService;
import com.kks.trashpedia.trash.model.vo.TrashPost;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class HomeController {
	
//	@GetMapping("/")
//	public String home() {
//		return "main";
//	}
	
	@Autowired
	private  TrashService trashService;
	
	@GetMapping("/")
	public ModelAndView home(HttpServletRequest request) {
		String ip = getClientIpAddress(request);
		System.out.println("접속한 유저 ip : "+ip);
		ModelAndView mav = new ModelAndView();
		//최근 업데이트된 쓰레기
		List<TrashPost> recentlyTrashList = trashService.getRecentlyTrashList(); 
		mav.addObject("recentlyTrashList", recentlyTrashList);
		
		log.info("{}",recentlyTrashList);
		request.getSession().setAttribute("ip", ip);
		mav.setViewName("main");
		return mav;
	}
	
	public static String getClientIpAddress(HttpServletRequest request) {
		String ipAddress = request.getHeader("X-Forwarded-For");
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("HTTP_X_FORWARDED");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("HTTP_X_CLUSTER_CLIENT_IP");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getHeader("REMOTE_ADDR");
        }
        if (ipAddress == null || ipAddress.isEmpty() || "unknown".equalsIgnoreCase(ipAddress)) {
            ipAddress = request.getRemoteAddr();
        }
        
        if (ipAddress.contains(":")) {
            ipAddress = ipAddress.split(":")[0];
        }
        
        return ipAddress;
    }
}
