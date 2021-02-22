package edu.human.com.util;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.human.com.member.service.EmployerInfoVO;
import edu.human.com.member.service.MemberService;

@Controller
public class CommonUtil {
	@Inject
	private MemberService memberService;
	
	/**
     * XSS 방지 처리. 자바스크립트 코드를 실행하지 못하는 특수문자로 replace(교체)하는내용
     * 접근권한 protected 현재클래스(패키지)aks dldydrksmd -> public 
     * @param data
     * @return
     */
    public String unscript(String data) {
        if (data == null || data.trim().equals("")) {
            return "";
        }

        String ret = data;

        ret = ret.replaceAll("<(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;script");
        ret = ret.replaceAll("</(S|s)(C|c)(R|r)(I|i)(P|p)(T|t)", "&lt;/script");

        ret = ret.replaceAll("<(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;object");
        ret = ret.replaceAll("</(O|o)(B|b)(J|j)(E|e)(C|c)(T|t)", "&lt;/object");

        ret = ret.replaceAll("<(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;applet");
        ret = ret.replaceAll("</(A|a)(P|p)(P|p)(L|l)(E|e)(T|t)", "&lt;/applet");

        ret = ret.replaceAll("<(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");
        ret = ret.replaceAll("</(E|e)(M|m)(B|b)(E|e)(D|d)", "&lt;embed");

        ret = ret.replaceAll("<(F|f)(O|o)(R|r)(M|m)", "&lt;form");
        ret = ret.replaceAll("</(F|f)(O|o)(R|r)(M|m)", "&lt;form");

        return ret;
    }
	@RequestMapping(value="/idcheck.do",method=RequestMethod.GET)
	@ResponseBody //반환값으로 페이지를 명시하지않고, text라고 명시
	public String idcheck(@RequestParam("emplyr_id") String emplyr_id) throws Exception {
		String result = "0";//기본값으로 중복ID가 없다는 표시 0
		EmployerInfoVO memberVO = memberService.viewMember(emplyr_id);
		if(memberVO != null) {
			result = "1";//중복ID가 있을때 표시 1
		}
		return result;//1.jsp 이페이지로 이동X, text값으로 반환합니다.
	}
}