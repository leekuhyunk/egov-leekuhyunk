package egovframework.com.cmm;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;
/**
 * ImagePaginationRenderer.java 클래스
 * 
 * @author 서준식
 * @since 2011. 9. 16.
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    -------------    ----------------------
 *   2011. 9. 16.   서준식       이미지 경로에 ContextPath추가
 * </pre>
 */
public class ImagePaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware{

	private ServletContext servletContext;
	
	public ImagePaginationRenderer() {
	
	}
	
	public void initVariables(){
		firstPageLabel    = "<li class=\"paginate_button page-item\">&#160;</li><li><a class=\"page-link\" href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">처음</a></li>";
        previousPageLabel = "<li class=\"paginate_button page-item\"><a class='page-link' href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">이전</a></li>";
        currentPageLabel  = "<li class=\"paginate_button page-item active\"><span class=\"page-link\">{0}</span></li>";
        otherPageLabel    = "<li class=\"paginate_button page-item\"><a class=\"page-link\" href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">{2}</a></li>";
        nextPageLabel     = "<li class=\"paginate_button page-item\">&#160;<a class=\"page-link\" href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">다음</a></li>";
        lastPageLabel     = "<li class=\"paginate_button page-item\"><a class=\"page-link\" href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">끝</a></li>";
	}

	

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}

}