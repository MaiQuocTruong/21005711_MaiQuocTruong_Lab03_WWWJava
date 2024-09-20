package bai3.language;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class LanguageFilter implements Filter {
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest) request;
        String language = req.getParameter("radLanguageCode");

        if (language != null) {
            req.getSession().setAttribute("languageCode", language);
        }

        chain.doFilter(request, response);
    }

    public void init(FilterConfig fConfig) throws ServletException {}
    public void destroy() {}
}
