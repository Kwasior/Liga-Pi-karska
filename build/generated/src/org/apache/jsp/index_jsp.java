package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Aplikacja LIGA PIŁKARSKA</title>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\" />\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("<div id=\"strona\">\n");
      out.write("<div id=\"naglowek\">\n");
      out.write("LOGO\n");
      out.write("</div>\n");
      out.write("<div id=\"menu_1\">\n");
      out.write("MENU\n");
      out.write("<ul>\n");
      out.write("<li>link 1</li>\n");
      out.write("<li>link 2</li>\n");
      out.write("<li>link 3</li>\n");
      out.write("<li>link 4</li>\n");
      out.write("<li>link 5</li>\n");
      out.write("<li>link 6</li>\n");
      out.write("<li>link 7</li>\n");
      out.write("<li>link 8</li>\n");
      out.write("<li>link 9</li>\n");
      out.write("<li>link 10</li>\n");
      out.write("</ul>\n");
      out.write("</div>\n");
      out.write("<div id=\"menu_2\">\n");
      out.write("FUNKCJE\n");
      out.write("<ul>\n");
      out.write("<li>link 11</li>\n");
      out.write("<li>link 12</li>\n");
      out.write("<li>link 13</li>\n");
      out.write("<li>link 14</li>\n");
      out.write("<li>link 15</li>\n");
      out.write("<li>link 16</li>\n");
      out.write("<li>link 17</li>\n");
      out.write("<li>link 18</li>\n");
      out.write("<li>link 19</li>\n");
      out.write("<li>link 20</li>\n");
      out.write("</ul>\n");
      out.write("</div>\n");
      out.write("<div id=\"zawartosc\">\n");
      out.write("zawartość\n");
      out.write("<p>Dane</p>\n");
      out.write("<p>Dane</p>\n");
      out.write("</div>\n");
      out.write("<div id=\"stopka\">\n");
      out.write("Copyright © 2016 Paweł Lorens\n");
      out.write("</div>\n");
      out.write("</div>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
