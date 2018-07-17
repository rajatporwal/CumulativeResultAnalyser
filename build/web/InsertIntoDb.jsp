<%@page import="javax.swing.JFileChooser"%>
<%@page import="java.io.IOException"%>
<%@include  file="checkSession.jsp" %>
<%--@page import="java.net.URL"--%>
<%@page import="java.io.File"%>
<%@page import="dao.*"%>
<%@page import="java.util.regex.*"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.Reader"%>
<%@include file="Headernew.html"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- 
    Document   : InsertIntoDb
    Author     : Rajat Porwal
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    </head>
    <body>
        <form method="post" action="InsertIntoDb.jsp">
     <div class="span7">   
<div class="widget stacked widget-table action-table">
    <br><br>
				<div class="widget-header">
					<i class="icon-th-list"></i>
                                        <h3><strong>Class Record</strong></h3>
                                </div> <!-- /widget-header --><br><br>
				
				<div class="widget-content">
                                    <center>
					<table class="table table-striped table-bordered">
             <thead>
                 <tr><th><center>S.NO.</center></th><th><center>TYPE</center></th><th><center>FILE</center></th></tr></thead>   
   <%
       try {
     
      HttpSession session=request.getSession();
      String rno=null,branch,status,semester,sub1,sub2,sub3,sub4,sub5,sub6,sub7,
            sub8,sub9,sub10,sub11,sub12,sub13,sub14,sub15,sub16,session1,code;
          int rnofrom,rnoto,count=1,subcount=0;
          
          rnofrom=Integer.parseInt(request.getParameter("rnofrom").toString());
          rnoto=Integer.parseInt(request.getParameter("rnoto").toString());
          
          semester=session.getAttribute("semester").toString();
          branch=session.getAttribute("branch").toString();
          session1=session.getAttribute("s1").toString();
         
          sub1=request.getParameter("sub1") + "-";
          sub2=request.getParameter("sub2") + "-";
          sub3=request.getParameter("sub3") + "-";
          sub4=request.getParameter("sub4") + "-";
          sub5=request.getParameter("sub5") + "-";
          sub6=request.getParameter("sub6") + "-";
          sub7=request.getParameter("sub7") + "-";
          sub8=request.getParameter("sub8") + "-";
          sub9=request.getParameter("sub9") + "-";
          sub10=request.getParameter("sub10") + "-";
          sub11=request.getParameter("sub11") + "-";
          sub12=request.getParameter("sub12") + "-";
          sub13=request.getParameter("sub13") + "-";
          sub14=request.getParameter("sub14") + "-";
          sub15=request.getParameter("sub15") + "-";
          sub16=request.getParameter("sub16") + "-";
          code=request.getParameter("code");
          
//          JFileChooser jf = new JFileChooser();
//          jf.setFileSelectionMode(JFileChooser.FILES_AND_DIRECTORIES); 
//          jf.showSaveDialog(null);
//          String jfile=jf.getCurrentDirectory().toString();
       String jfile=request.getParameter("path");
       ReadHtml readhtml= new ReadHtml();    
      for (int j = rnofrom; j <=rnoto; j++) 
      {
       int i=30,finalresultgrace=0,finalresultfail=0;
    //*****************Inserting data of HTML file******************
    
       File f =new File( jfile + "/" + j + ".html");
       if(f.exists()) {
       FileReader reader=null;
       reader= new FileReader(jfile +   "/" +j + ".html");
      
      String s1=InsertIntoDb.extractText(reader);
      String[] words=s1.split("\\s");
        
      //****************Name************************
       for ( int k=i ; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("name"))    
       {    
       readhtml.setName(words[i+1] + " " + words[i+2] );
           break;
       }
      }
        //****************Enrollment Number************************
       for (int k=i; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("Roll"))  
       {
          
         rno=words[i+2].substring(0,Math.min(12,words[i+2].length())); 
         readhtml.setRollno(words[i+2].substring(0,Math.min(12,words[i+2].length())));break;
         
       }
      }
     
          //****************Course************************
        for ( int k=i ; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("course"))    
       {    
         readhtml.setCourse(words[i+1]);
           break;
       }
      }
        
         //****************Branch************************  
        for ( i=10 ; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("branch"))    
       {    
       readhtml.setBranch(words[i+1].substring(0,Math.min(2,words[i+1].length())));
           break;
       }
      }
        
        //****************Semester************************   
        for ( int k=i ; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("semester"))    
       {    
       readhtml.setSem(words[i+1].substring(0,Math.min(1,words[i+1].length()))) ;
           break;
       }
      }
        
         //****************Status************************  
       for ( int k=i ; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("status"))    
       {    
       readhtml.setStatus(words[i+1]);
           break;
       }
      }
     
        //****************Subject 1************************
      for (i=40; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub1))
       {
        if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub1(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub1(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
       else 
       {
         readhtml.setSub1("ABS");
//         finalresultfail=1;
         subcount++;
       }
      }
      
         //****************Subject 2************************
      for (i=40; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub2))
       {  
          if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub2(words[i+3]);
            finalresultfail=1;
        }
        else
          {   
            readhtml.setSub2(words[i+4]);
          }
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
       else
       {
           readhtml.setSub2("ABS");
           subcount++;
//           finalresultfail=1;                
       }
      }
      //****************Subject 3************************
      for (i=40; i < words.length; i++)
      {
          if(words[i].equalsIgnoreCase(sub3))   
       {
        if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub3(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub3(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
      }
          else
       {
           readhtml.setSub3("ABS");
           subcount++;
//           finalresultfail=1;                
       }
     } 
      //****************Subject 4************************
      for (i=40; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub4))   
       {    
        if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub4(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub4(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
       else
       {
           readhtml.setSub4("ABS");
           subcount++;
//           finalresultfail=1;                
       }
      }
      
      //****************Subject 5************************
      for (i=40; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub5))    
       {
         if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub5(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub5(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
       else
       {
           readhtml.setSub5("ABS");
           subcount++;
//           finalresultfail=1;                
       }
     }
     
      //****************Subject 6************************
      for (i=40; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub6))    
       {
       if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub6(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub6(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
       else
       {
           readhtml.setSub6("ABS");
           subcount++;
//           finalresultfail=1;                
       }
      }
      
      //****************Subject 7************************
      for (i=40; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub7))   
       {    
       if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub7(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub7(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
       else
       {
           readhtml.setSub7("ABS");
           subcount++;
//           finalresultfail=1;                
       }
      }
      
      //****************Subject 8************************
      for (i=40; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub8)) 
       {
      if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub8(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub8(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
       else
       {
           readhtml.setSub8("ABS");
           subcount++;
//           finalresultfail=1;                
       }
      }
      
      //****************Subject 9************************
      for (i=40; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub9))    
       {    
      if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub9(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub9(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
       else
       {
           readhtml.setSub9("ABS");
           subcount++;
//           finalresultfail=1;                
       }
      }
      
      //****************Subject 10************************
      for (i=40; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub10))    
       {
      if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub10(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub10(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
          else
       {
           readhtml.setSub10("ABS");
           subcount++;
//           finalresultfail=1;                
       }
      }
      
      //****************Subject 11************************
      for (i=40; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub11))   
       {   
        if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub11(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub11(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
          else
       {
           readhtml.setSub11("ABS");
           subcount++;
//           finalresultfail=1;                
       }
      }
      
      //****************Subject 12************************
      for (i=40; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub12))   
       {   
       if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub12(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub12(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
          else
       {
           readhtml.setSub12("ABS");
           subcount++;
//           finalresultfail=1;                
       }
      }
      
      //****************Subject 13************************
      for (i=40; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub13))   
       {   
       if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub13(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub13(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
           else
       {
           readhtml.setSub13("ABS");
           subcount++;  
//           finalresultfail=1;                
       }
      }
      
      //****************Subject 14************************
      for (i=40; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub14))   
       {   
        if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub14(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub14(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
         else
       {
           readhtml.setSub14("ABS");
//           finalresultfail=1;                
       }
      }
      
      //****************Subject 15************************
      for (i=40; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub15))   
       {   
       if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub15(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub15(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
             else
       {
           readhtml.setSub15("ABS");
//           finalresultfail=1;                
       }
      }
      
      //****************Subject 16************************
      for (i=40; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub16))   
       {   
        if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub16(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub16(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##")  || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
      else
       {
           readhtml.setSub16("ABS");
           //finalresultfail=1;                
       }
      }
      
      //****************Subject Result************************
        if(finalresultfail==1) 
        readhtml.setResult("FAIL"); 
        else
        if(finalresultgrace==1) 
        readhtml.setResult("PASS WITH GRACE");
        else       
        readhtml.setResult("PASS"); 
        
        if(subcount!=12)
         readhtml.setResult("FAIL");    
            
      //****************Sgpa & Cgpa************************
         for (int k=70; k < words.length-1; k++){
       
       if(words[k].equalsIgnoreCase("sgpa"))    {
            
             for ( i =k; i < words.length; i++) {
                  int len=4;
                  if(Character.isDigit(words[i].charAt(0)))
                if(len==words[i].length())
              {
                readhtml.setSgpa(words[i]);
                readhtml.setCgpa(words[i+1]);  
                break;        
              }
             }
           }
        }
      //*******************Batch*****************************  
          readhtml.setSession(session1);     
          readhtml.setCode(code);     
          
        ReadHtmlDAO readhtmldao = new ReadHtmlDAO();
        
    //*****************Searching Record********************************
    
        if(readhtmldao.checkStudentRecord(rno, branch, semester, session1)){
        if(readhtmldao.updateData(readhtml)){
          %>
          <!--<span  style="float: left;"><strong><h4><b>•Record of file <%=j%> Updated</b></h4></strong></span>-->     
             <tr><td><center><%=count++%></center></td><td><center>Updated</center></td><td><center>File <%=j%></center></td></tr>  
          <%
      }
           else{
         %>
       <!--<span  style="float: left;"><strong><h3><b>•Record of file <%=j%> Not Updated</b></h3></strong></span>-->     
         <tr><td><center><b><%=count++%></b></center></td><td><center><b>Not Updated</b></center></td><td><center><b>File <%=j%></b></center></td></tr>  
         <%
             }
        }
        else{
      if(readhtmldao.insertData(readhtml)){
          %>
          <!--<span  style="float: left;"><strong><h4><b>•Record of file <%=j%> Inserted</b></h4></strong></span>-->     
          <tr><td><center><%=count++%></center></td><td><center>Inserted</center></td><td><center>File <%=j%></center></td></tr>  
          
          <%
      }
           else{
         %>
       <!--<span  style="float: left;"><strong><h3><b>•Record of file <%=j%> Not Inserted</b></h3></strong></span>-->     
         <tr><td><center><b><%=count++%></b></center></td><td><center><b>Not Inserted</b></center></td><td><center><b>File <%=j%></b></center></td></tr>  
         <%
             }
       }
      }
        else{
//***********************Inserting data of HTM files*****************
       File file =new File(jfile + "/" +j+".htm");
       if(file.exists()) {
       FileReader reader=null;
       reader= new FileReader(jfile +   "/" +j + ".htm");
      
      String s1=InsertIntoDb.extractText(reader);
      String[] words=s1.split("\\s");
        
      //****************Name************************
       for ( int k=i ; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("name"))    
       {    
       readhtml.setName(words[i+1] + " " + words[i+2] );
           break;
       }
      }
        //****************Enrollment Number************************
       for (int k=i; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("Roll"))  
       {
          
         rno=words[i+2].substring(0,Math.min(12,words[i+2].length())); 
         readhtml.setRollno(words[i+2].substring(0,Math.min(12,words[i+2].length())));
         break;
         
       }
      }
     
          //****************Course************************
        for ( int k=i ; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("course"))    
       {    
       readhtml.setCourse(words[i+1]);
           break;
       }
      }
        
         //****************Branch************************  
        for ( i=10 ; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("branch"))    
       {    
       readhtml.setBranch(words[i+1].substring(0,Math.min(2,words[i+1].length())));
           break;
       }
      }
        
        //****************Semester************************   
        for ( int k=i ; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("semester"))    
       {    
       readhtml.setSem(words[i+1].substring(0,Math.min(1,words[i+1].length()))) ;
           break;
       }
      }
        
         //****************Status************************  
       for ( int k=i ; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase("status"))    
       {    
       readhtml.setStatus(words[i+1]);
           break;
       }
      }
     
        //****************Subject 1************************
      for (int k=i; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub1))
       {
        if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub1(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub1(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
      }
      
         //****************Subject 2************************
      for (int k=i; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub2))
       {  
          if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub2(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub2(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
      }
      
      //****************Subject 3************************
      for (int k=i; i < words.length; i++)
      {
          if(words[i].equalsIgnoreCase(sub3))   
       {
        if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub3(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub3(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
      }
     } 
      //****************Subject 4************************
      for (int k=i; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub4))   
       {    
        if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub4(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub4(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
      }
      
      //****************Subject 5************************
      for (int k=i; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub5))    
       {
         if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub5(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub5(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
     }
     
      //****************Subject 6************************
      for (int k=i; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub6))    
       {
       if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub6(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub6(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
      }
      
      //****************Subject 7************************
      for (int k=i; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub7))   
       {    
       if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub7(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub7(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
      }
      
      //****************Subject 8************************
      for (int k=i; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub8)) 
       {
      if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub8(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub8(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
      }
      
      //****************Subject 9************************
      for (int k=i; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub9))    
       {    
      if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub9(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub9(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
      }
      
      //****************Subject 10************************
      for (int k=i; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub10))    
       {
      if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub10(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub10(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
      }
      
      //****************Subject 11************************
      for (int k=i; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub11))   
       {   
        if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub11(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub11(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
      }
      
      //****************Subject 12************************
      for (int k=i; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub12))   
       {   
       if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub12(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub12(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
      }
      
      //****************Subject 13************************
      for (int k=i; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub13))   
       {   
       if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub13(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub13(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
      }
      
      //****************Subject 14************************
      for (int k=i; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub14))   
       {   
        if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub14(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub14(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
      }
      
      //****************Subject 15************************
      for (int k=i; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub15))   
       {   
       if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub15(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub15(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
      }
      
      //****************Subject 16************************
      for (int k=i; i < words.length; i++)
      {
       if(words[i].equalsIgnoreCase(sub16))   
       {   
        if(words[i+3].equalsIgnoreCase("F")){ 
            readhtml.setSub16(words[i+3]);
            finalresultfail=1;
        }
        else
            readhtml.setSub16(words[i+4]);
       
        if(words[i+4].equalsIgnoreCase("C##") || words[i+4].equalsIgnoreCase("D##"))
        finalresultgrace=1;    
       break;
       }
      }
      
      //****************Subject Result************************
       
        if(finalresultfail==1) 
        readhtml.setResult("FAIL"); 
        else
        if(finalresultgrace==1) 
        readhtml.setResult("PASS WITH GRACE");
        else       
        readhtml.setResult("PASS"); 
        
            
      //****************Sgpa & Cgpa************************
         for (int k=70; k < words.length-1; k++){
       
       if(words[k].equalsIgnoreCase("sgpa"))    {
            
             for ( i =k; i < words.length; i++) {
                  int len=4;
                  if(Character.isDigit(words[i].charAt(0)))
                if(len==words[i].length())
              {
                readhtml.setSgpa(words[i]);
                readhtml.setCgpa(words[i+1]);  
                break;        
              }
             }
           }
        }
      //*******************Batch*****************************  
          readhtml.setSession(session1);     
          readhtml.setCode(code);

        ReadHtmlDAO readhtmldao = new ReadHtmlDAO();
        
    //*****************Searching Record********************************
    
        if(readhtmldao.checkStudentRecord(rno, branch, semester, session1)){
        if(readhtmldao.updateData(readhtml)){
          %>
          <!--<span  style="float: left;"><strong><h4><b>•Record of file <%=j%> Updated</b></h4></strong></span>-->     
          <tr><td><center><%=count++%></center></td><td><center>Updated</center></td><td><center>File <%=j%></center></td></tr>  
          <%
      }
           else{
         %>
       <!--<span  style="float: left;"><strong><h3><b>•Record of file <%=j%> Not Updated</b></h3></strong></span>-->     
         <tr><td><center><b><%=count++%></b></center></td><td><center><b>Not Updated</b></center></td><td><center><b>File <%=j%></b></center></td></tr>  
         <%
             }
        }
        else{
      if(readhtmldao.insertData(readhtml)){
          %>
          <!--<span  style="float: left;"><strong><h4><b>•Record of file <%=j%> Inserted</b></h4></strong></span>-->  
          <tr><td><center><%=count++%></center></td><td><center>Inserted</center></td><td><center>File <%=j%></center></td></tr>  
          <%
      }
           else{
         %>
       <!--<span  style="float: left;"><strong><h3><b>•Record of file <%=j%> Not Inserted</b></h3></strong></span>-->     
         <tr><td><center><b><%=count++%></b></center></td><td><center><b>Not Inserted</b></center></td><td><center><b>File <%=j%></b></center></td></tr>  
         <%
             }
       }
      }
          else{
         %>
       <!--<span  style="float: left;"><strong><h2><b>•Record of file <%=j%> Not Found</b></h2></strong></span>-->     
         <tr><td><center><b><%=count++%></b></center></td><td><center><b>Not Found</b></center></td><td><center><b>File <%=j%></b></center></td></tr>  
         <%
             }
     }
    }
  }
       catch (IOException e) {
             
    %>
    <br><br><br><br><br><br><br><br>
       <span  style="float: center;"><strong><h2><b>•<%="File not found,please try again"%> </b></h2></strong></span> 
    
       <%     
                      out.println(e);

           out.println("<script type=\"text/javascript\">");
           out.println("alert('File not found,please try again');");
              //out.println("location='EnterPreDetails.jsp';");
              out.println("</script>");
           }
       catch (StringIndexOutOfBoundsException e) {
             
    %>
    <br><br><br><br><br><br><br><br>
       <span  style="float: center;"><strong><h2><b>•<%="Please check the supporting files,and try again later"%> </b></h2></strong></span> 
       <span  style="float: center;"><strong><h2><b>•<%=e%> </b></h2></strong></span> 
    
       <%     
           out.println("<script type=\"text/javascript\">");
           out.println("alert('File not found,please try again');");
              //out.println("location='EnterPreDetails.jsp';");
              out.println("</script>");
              
           }
       catch (Exception e) {
             
    %>
    <br><br><br><br><br><br><br><br>
       <span  style="float: center;"><strong><h2><b>•<%="Make sure the details you entered are correct and try again"%> </b></h2></strong></span> 
       <span  style="float: center;"><strong><h2><b>•<%="Error : Duplicate Entry Found "%> </b></h2></strong></span> 
    
       <%     
              out.println(e);
              out.println("<script type=\"text/javascript\">");
              out.println("alert('Record not inserted, try again');");
              //out.println("location='EnterPreDetails.jsp';");
              out.println("</script>");
           }
   %>
        </table> </div> 
     </div> 
       </div>     
        </form>
    </body>
</html>
