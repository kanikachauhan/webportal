package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class HomePage_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fs_005fif_0026_005ftest;
  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fs_005factionerror_005fnobody;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fs_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _005fjspx_005ftagPool_005fs_005factionerror_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fs_005fif_0026_005ftest.release();
    _005fjspx_005ftagPool_005fs_005factionerror_005fnobody.release();
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
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("     \r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<META Http-Equiv=\"Cache-Control\" Content=\"no-cache\">\r\n");
      out.write("<META Http-Equiv=\"Pragma\" Content=\"no-cache\">\r\n");
      out.write("<META Http-Equiv=\"Expires\" Content=\"0\">\r\n");
      out.write("<title>Alarm Connect</title>\r\n");
      out.write("<script src=\"http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css\"/>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("/org/staticcontent/jquery.js\"></script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("/org/staticcontent/bootstrap.min.js\"></script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("/org/staticcontent/angular.min.js\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (PageContext)_jspx_page_context, null, false));
      out.write("/org/staticcontent/bootstrap-theme.min.css\"/>\r\n");
      out.write("<script>\r\n");
      out.write("function disablebackbutton(){\r\n");
      out.write("\t//window.history.forward();\r\n");
      out.write("\thistory.pushState(null,null,location.href);\r\n");
      out.write("\twindow.onpopstate = function(event){history.go(1);};\r\n");
      out.write("}\r\n");
      out.write("disablebackbutton();\r\n");
      out.write("</script>\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write("\t#centertag{\r\n");
      out.write("\t\theight:400px;\r\n");
      out.write("\t\tborder: 5px solid #FFE200;\r\n");
      out.write("\t\t-webkit-border-radius: 12px; \r\n");
      out.write("\t\tbackground: #242316;\r\n");
      out.write("\t\tbackground-repeat: no-repeat;\r\n");
      out.write("\t\tbackground-size:100% 100%;\r\n");
      out.write("\t\tborder-spacing: 2px;\r\n");
      out.write("\t}\r\n");
      out.write("\t.carousel-control.right, .carousel-control.left {\r\n");
      out.write("\t\tbackground-image: none;\r\n");
      out.write("\t\tcolor: #BEB7B7;\r\n");
      out.write("\t}\r\n");
      out.write("\t.carousel-indicators li {\r\n");
      out.write("\t\tborder-color: #BEB7B7;\r\n");
      out.write("\t}\r\n");
      out.write("\t.carousel-indicators li.active {\r\n");
      out.write("\t\tbackground-color: #BEB7B7;\r\n");
      out.write("\t}\r\n");
      out.write("\t.jumbotron{\r\n");
      out.write("\t\tbackground-image:url(\"logo.jpg\");\r\n");
      out.write("\t\tbackground-size: 15% 100%;\r\n");
      out.write("\t\tbackground-repeat: no-repeat;\r\n");
      out.write("\t\tmargin:0px 40px 0px 40px;\r\n");
      out.write("\t\tborder-radius:5px;\r\n");
      out.write("\t\tborder:5px solid #5B646D;\r\n");
      out.write("\t\tbackground-color:#5B646D;\r\n");
      out.write("\t}\r\n");
      out.write("\ta:active{\r\n");
      out.write("\t\t text-decoration:none;\r\n");
      out.write("\t}\r\n");
      out.write("\ta:hover{\r\n");
      out.write("\t\t text-decoration:none;\t\r\n");
      out.write("\t\t}\r\n");
      out.write("\ta:link{\r\n");
      out.write("\t\tcolor:black;\r\n");
      out.write("\t\tfont-weight:bold;\r\n");
      out.write("\t\t\t\t text-decoration:none;\r\n");
      out.write("\t}\r\n");
      out.write("\t .thumbnail {\r\n");
      out.write("      padding: 0 0 15px 0;\r\n");
      out.write("      border: none;\r\n");
      out.write("      border-radius: 0;\r\n");
      out.write("  }\r\n");
      out.write("  .thumbnail img {\r\n");
      out.write("      width: 100%;\r\n");
      out.write("      height: 100%;\r\n");
      out.write("      margin-bottom: 10px;\r\n");
      out.write("  }\r\n");
      out.write(" .maincontent{\r\n");
      out.write(" \tmargin:10px;\t\r\n");
      out.write(" }\r\n");
      out.write(" .container-fluid{\r\n");
      out.write(" \tbackground-color:white;\r\n");
      out.write(" }\r\n");
      out.write(" .abc{\r\n");
      out.write(" width:100%;\r\n");
      out.write(" height:100%;\r\n");
      out.write(" margin-top:50%;\r\n");
      out.write(" margin-bottom:10%;\r\n");
      out.write(" margin-left:10%;\r\n");
      out.write(" border:1px solid black;\r\n");
      out.write("\r\n");
      out.write(" }\r\n");
      out.write(" .rounded{\r\n");
      out.write(" \tborder:1px solid grey;\r\n");
      out.write(" \tpadding:60px;\r\n");
      out.write(" \tmargin:50px;\r\n");
      out.write(" \tborder-radius:60px;\r\n");
      out.write(" \tbackground-color:grey;\r\n");
      out.write(" }\r\n");
      out.write(".abcd{\r\n");
      out.write("background-color:#1C1C18;\r\n");
      out.write(" color:#FFE200;\r\n");
      out.write(" padding:50px;\r\n");
      out.write(" font-size:50px;\r\n");
      out.write("}\r\n");
      out.write(".abcd:hover{\r\n");
      out.write(" background-color:#FFE200;\r\n");
      out.write(" color:white;\r\n");
      out.write(" transition-property:color;\r\n");
      out.write(" transition-duration:1s;\r\n");
      out.write(" transition-timing-function: ease-out;\r\n");
      out.write(" transition-delay:initial;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t\t<div class=\"container-fluid\" style=\"background-color:#1C1C18;\">\r\n");
      out.write("\t\t<div class=\"maincontent\">\r\n");
      out.write("\t\t<div class=\"jumbotron\">\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t\t<!-- <div class=\"row\" style=\"margin-top:50px;margin-bottom:50px;margin-left:50px;margin-right:50px;padding:150px;border:5px solid #FFE200;border-radius:10px;background-color:#242316;\">\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-3\"><center>\r\n");
      out.write("\t\t\t\t\t\t<a href=\"#about\"><i style=\"border:2px solid #1C1C18;border-radius:150px;\" class=\"glyphicon glyphicon-bell abcd\"></i></a>\r\n");
      out.write("\t\t\t\t\t\t\t<br><br><br><br><br><h3 style=\"color:#FFE200;\"><b>About</b></h3></center>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-3\"><center>\r\n");
      out.write("\t\t\t\t\t<a href=\"#login\"><i style=\"border:2px solid #1C1C18;border-radius:150px;\" class=\"glyphicon glyphicon-user abcd\"></i></a>\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<br><br><br><br><br><h3><b style=\"color:#FFE200;\">Login</b></h3></center>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-3\"><center>\r\n");
      out.write("\t\t\t\t\t<a href=\"#products\"><i style=\"border:2px solid #1C1C18;border-radius:150px;\" class=\"glyphicon glyphicon-menu-hamburger abcd\"></i></a>\r\n");
      out.write("\t\t\t\t\t\t<br><br><br><br><br><h3><b style=\"color:#FFE200;\">Products</b></h3></center>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-3\"><center>\r\n");
      out.write("\t\t\t\t\t<a href=\"#contactus\"><i style=\"border:2px solid #1C1C18;border-radius:150px;\" class=\"glyphicon glyphicon-earphone abcd\"></i></a>\r\n");
      out.write("\t\t\t\t\t\t<br><br><br><br><br><h3><b style=\"color:#FFE200;\">Contact</b></h3></center>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t</div> -->\r\n");
      out.write("\r\n");
      out.write("\t\t\t<div id=\"login\" style=\"margin:50px 50px 100px 50px;background-color:#242316;border:5px solid #FFE200;padding:50px 200px 100px 150px;border-radius:15px;\">\r\n");
      out.write("\t\t\t\t<div id=\"logintag\">\r\n");
      out.write("\t\t\t\t<h1 style=\"color:#FFE200;\"><span style=\"color:#FFE200;\"><i class=\"glyphicon glyphicon-user\" style=\"background-color:#242316;\"></i></span>Login</h1>\r\n");
      out.write("\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td><a data-toggle=\"tab\" href=\"#menu1\" class=\"abc1\"><h2 style=\"padding:10px;color:#939393;padding-right:10px;\">Customer</h2></a></td>\r\n");
      out.write("\t\t\t\t\t\t<td><a data-toggle=\"tab\" href=\"#menu2\" class=\"abc1\"><h2 style=\"padding:10px;color:#939393;padding-right:10px;\">Admin</h2></a></li></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t");
      if (_jspx_meth_s_005fif_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t\t\t\t<div class=\"tab-content\">\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<div id=\"menu1\" class=\"tab-pane fade in active\">\r\n");
      out.write("\t\t\t\t\t<h3 style=\"color:#FFE200;\">Customer Login Here!!</h3>\r\n");
      out.write("\t\t\t\t\t\t<form action=\"myaccount/user\" role=\"form\" method=\"post\"> \r\n");
      out.write("\t\t\t\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr style=\"padding:5px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td style=\"padding:5px;font-weight:bold;color:#FFE200;\">User Name:</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td style=\"padding:5px;\"><input type=\"email\" class=\"form-control\" placeholder=\"UserName\" name=\"username\" ng-model=\"myInput\" required/></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr><br>\r\n");
      out.write("\t\t\t\t\t\t\t\t<tr style=\"padding:5px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td style=\"padding:5px;font-weight:bold;color:#FFE200;\">Password:</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<td style=\"padding:5px;\"><input type=\"password\" class=\"form-control\"  placeholder=\"Password\" name=\"password\" label=\"Password:\" id=\"pwd\" required/></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t</table><br>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"col-sm-2\"><input type=\"submit\" class=\"form-control\" style=\"font-weight:bold;color:#242316;margin-left:80px;font-size:20px;width:150px;height:50px;\" value=\"Login\"/></div>\t\t\r\n");
      out.write("\t\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<div id=\"menu2\" class=\"tab-pane fade\">\r\n");
      out.write("\t\t\t\t\t\t<h3 style=\"color:#FFE200;\">Admin Login Here!!</h3>\r\n");
      out.write("\t\t\t\t\t\t\t<form action=\"myadmin/admin\" name=\"myForm\" method=\"post\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<tr style=\"padding:5px;\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td style=\"padding:5px;font-weight:bold;color:#FFE200;\">User Name:</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td style=\"padding:5px;\"><input type=\"email\" class=\"form-control\" placeholder=\"UserName\" name=\"username\" ng-model=\"myInput\" required/></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr><br>\t\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td style=\"padding:5px;font-weight:bold;color:#FFE200;\">Password:</td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<td style=\"padding:5px;\"><input type=\"password\" class=\"form-control\"  placeholder=\"Password\" name=\"password\" label=\"Password:\" id=\"pwd\" required/></td>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t\t\t</table><br>\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"col-sm-2\"><input type=\"submit\" class=\"form-control\" style=\"font-weight:bold;color:#FFE200;margin-left:80px;font-size:20px;width:150px;height:50px;\" value=\"Login\"/></div>\r\n");
      out.write("\t\t\t\t\t\t</form> \r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t\t</div><br><br><br>\r\n");
      out.write("\t\t \t<!-- <div id=\"about\" style=\"margin:50px 50px 75px 50px;background-color:#242316;border:5px solid #FFE200;padding:50px 150px 100px 150px;border-radius:15px;\">\r\n");
      out.write("\t\t\t\t<div id=\"abouttag\">\r\n");
      out.write("\t\t\t\t\t<h1 style=\"color:#FFE200;\"><span style=\"color:#FFE200;\"><i class=\"glyphicon glyphicon-hand-right\" style=\"background-color:#242316;\" ></i></span>About</h1>\r\n");
      out.write("\t\t\t\t\t<h4>A Device used in SOS situtaion to help people by raising alarm specific to their network.</h4>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\t -->\r\n");
      out.write("\t\t\t<!-- <div id=\"products\" style=\"margin:100px 50px 100px 50px;background-color:#242316;border:5px solid #FFE200;padding:50px 150px 100px 150px;border-radius:15px;\">\r\n");
      out.write("\t\t\t\t<h1 style=\"color:#FFE200;\"><span style=\"color:#FFE200;\"><i class=\"glyphicon glyphicon-menu-hamburger\" style=\"background-color:#242316;\"></i></span>Products</h1><br>\r\n");
      out.write("\t\t\t\t<div class=\"container-fluid text-center bg-grey\" style=\"color:grey;\">\r\n");
      out.write(" \t <h4>Our Products</h4>\r\n");
      out.write("  <div class=\"row text-center\">\r\n");
      out.write("    <div class=\"col-sm-4\">\r\n");
      out.write("      <div class=\"thumbnail\">\r\n");
      out.write("        <img src=\"img2.jpg\" alt=\"Wireless Mini Door\" width=\"400\" height=\"300\">\r\n");
      out.write("        <p><strong>Wireless Mini Door</strong></p>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"col-sm-4\">\r\n");
      out.write("      <div class=\"thumbnail\">\r\n");
      out.write("        <img src=\"img3.jpg\" alt=\"Wireless Smoke Detector\" width=\"400\" height=\"300\">\r\n");
      out.write("        <p><strong>Wireless Smoke Detector</strong></p>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"col-sm-4\">\r\n");
      out.write("      <div class=\"thumbnail\">\r\n");
      out.write("        <img src=\"img4.jpg\" alt=\"Wireless Flood Detector\" width=\"400\" height=\"300\">\r\n");
      out.write("        <p><strong>Wireless Flood Detector</strong></p>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("  </div>\r\n");
      out.write("</div></div> -->\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t \t<!-- <div id=\"contactus\" style=\"background-color:#242316;color:white; font-family:Tahoma, Geneva, sans-serif;border-radius:5px;padding:10px 50px 50px 50px;\">\r\n");
      out.write("\t\t\t<div class=\"row\">\r\n");
      out.write("\t\t\t\t<div class=\"col-sm-5\">\r\n");
      out.write("\t\t\t\t\t<h3>Contact us.</h3>\r\n");
      out.write("\t\t\t\t\t<p style=\"padding-bottom:2px;padding-left:5px;\"><span class=\"glyphicon glyphicon-map-marker\"></span> Chicago, US</p>\r\n");
      out.write("\t\t\t\t\t<p style=\"padding-bottom:2px;padding-left:5px;\"><span class=\"glyphicon glyphicon-phone\"></span> +00 1515151515</p>\r\n");
      out.write("\t\t\t\t\t<p style=\"padding-bottom:2px;padding-left:5px;\"><span class=\"glyphicon glyphicon-envelope\"></span> myemail@something.com</p> \r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div> -->\r\n");
      out.write("\t\t</div>\r\n");
      out.write("</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_s_005fif_005f0(PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  s:if
    org.apache.struts2.views.jsp.IfTag _jspx_th_s_005fif_005f0 = (org.apache.struts2.views.jsp.IfTag) _005fjspx_005ftagPool_005fs_005fif_0026_005ftest.get(org.apache.struts2.views.jsp.IfTag.class);
    _jspx_th_s_005fif_005f0.setPageContext(_jspx_page_context);
    _jspx_th_s_005fif_005f0.setParent(null);
    // /HomePage.jsp(151,3) name = test type = java.lang.String reqTime = false required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_s_005fif_005f0.setTest("hasActionErrors()");
    int _jspx_eval_s_005fif_005f0 = _jspx_th_s_005fif_005f0.doStartTag();
    if (_jspx_eval_s_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      if (_jspx_eval_s_005fif_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.pushBody();
        _jspx_th_s_005fif_005f0.setBodyContent((javax.servlet.jsp.tagext.BodyContent) out);
        _jspx_th_s_005fif_005f0.doInitBody();
      }
      do {
        out.write("\r\n");
        out.write("\t\t\t\t\t<div class=\"errors\">\r\n");
        out.write("\t\t\t\t\t\t");
        if (_jspx_meth_s_005factionerror_005f0(_jspx_th_s_005fif_005f0, _jspx_page_context))
          return true;
        out.write("\r\n");
        out.write("\t\t\t\t\t</div>\r\n");
        out.write("\t\t\t\t");
        int evalDoAfterBody = _jspx_th_s_005fif_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
      if (_jspx_eval_s_005fif_005f0 != javax.servlet.jsp.tagext.Tag.EVAL_BODY_INCLUDE) {
        out = _jspx_page_context.popBody();
      }
    }
    if (_jspx_th_s_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fs_005fif_0026_005ftest.reuse(_jspx_th_s_005fif_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fs_005fif_0026_005ftest.reuse(_jspx_th_s_005fif_005f0);
    return false;
  }

  private boolean _jspx_meth_s_005factionerror_005f0(javax.servlet.jsp.tagext.JspTag _jspx_th_s_005fif_005f0, PageContext _jspx_page_context)
          throws Throwable {
    PageContext pageContext = _jspx_page_context;
    JspWriter out = _jspx_page_context.getOut();
    //  s:actionerror
    org.apache.struts2.views.jsp.ui.ActionErrorTag _jspx_th_s_005factionerror_005f0 = (org.apache.struts2.views.jsp.ui.ActionErrorTag) _005fjspx_005ftagPool_005fs_005factionerror_005fnobody.get(org.apache.struts2.views.jsp.ui.ActionErrorTag.class);
    _jspx_th_s_005factionerror_005f0.setPageContext(_jspx_page_context);
    _jspx_th_s_005factionerror_005f0.setParent((javax.servlet.jsp.tagext.Tag) _jspx_th_s_005fif_005f0);
    int _jspx_eval_s_005factionerror_005f0 = _jspx_th_s_005factionerror_005f0.doStartTag();
    if (_jspx_th_s_005factionerror_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fs_005factionerror_005fnobody.reuse(_jspx_th_s_005factionerror_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fs_005factionerror_005fnobody.reuse(_jspx_th_s_005factionerror_005f0);
    return false;
  }
}
