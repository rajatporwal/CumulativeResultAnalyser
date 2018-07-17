<%@page session="false"%>
<%
  try
  {    
     HttpSession session=request.getSession();  
    String uname=null,upass=null;    
    uname=session.getAttribute("username").toString();
    upass=session.getAttribute("password").toString();
    if ((uname==null && upass==null))
         response.sendRedirect("Headernew.html");  
     }
catch(NullPointerException e)
{
         response.sendRedirect("Headernew.html");  
}          
%>
