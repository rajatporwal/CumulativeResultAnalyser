<%--<%@page import="javax.swing.filechooser.FileSystemView"%>--%>
<%@page import="org.apache.tomcat.util.http.fileupload.IOUtils"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="jxl.write.WritableImage"%>
<%@page import="java.lang.Math"%>
<%@page import="jxl.HeaderFooter"%>
<%@page import="jxl.format.*"%>
<%@page import="jxl.write.WritableCellFormat"%>
<%@page import="jxl.write.WritableFont"%>
<%@page import="jxl.read.biff.BiffException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itextpdf.text.Font.FontFamily"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="jxl.write.Label"%>
<%@page import="jxl.write.WritableWorkbook"%>
<%@page import="jxl.Workbook"%>
<%@page import="jxl.write.WritableSheet"%>
<%@include file="Headernew.html" %>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : GenerateExcel
    Author     : Rajat Porwal
--%>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      
    </head>
    <body>
        <%
              OutputStream out1=null;
              InputStream in1=null;
              File f=null;
          try{
//            HttpSession session=request.getSession();
           String code=null;
             String branch=session.getAttribute("searchbranch").toString();
             String semester=session.getAttribute("searchsemester").toString();
             String batch=session.getAttribute("batch").toString();
             String type=session.getAttribute("type").toString();
             String yearexcel=session.getAttribute("yearexcel").toString();
             String semexcel=session.getAttribute("semexcel").toString();
             if(type.equals("class"))
             {
              code=session.getAttribute("code").toString();
             }
             String department=session.getAttribute("department").toString().toUpperCase();
             int tsubjects=Integer.parseInt(session.getAttribute("searchtheorysubjects").toString());
             int psubjects=Integer.parseInt(session.getAttribute("searchpracticalsubjects").toString());
             String sub1=null,sub2=null,sub3=null,sub4=null,sub5=null,sub6=null,sub7=null,sub8=null,sub9=null,sub10=null,
                    sub11=null,sub12=null,sub13=null,sub14=null,sub15=null,sub16=null;
             
             ReadHtmlDAO rd = new ReadHtmlDAO();
             List <ReadHtml>myresultlist= new ArrayList<ReadHtml>();
             
             if(type.equals("class"))
             myresultlist = rd.searchCodeStudent(branch,semester,code,batch);
             else
             myresultlist = rd.searchAllStudentBatch(branch,semester,batch); 

               f = new File(request.getServletContext().getRealPath("/")+"RESULT.xls");
              
             response.setContentType("application/vnd.ms-excel");
             response.setHeader("Content-Disposition", "attachment; filename=sampleName.xls");
             out1=response.getOutputStream();
             WritableWorkbook myexel = Workbook.createWorkbook(f);
             WritableSheet mysheet = myexel.createSheet("mysheet", 0);
             
             WritableFont cellFontHeading = new WritableFont(WritableFont.TIMES, 11);
             cellFontHeading.setBoldStyle(WritableFont.BOLD);
             cellFontHeading.setColour(Colour.BLACK);
             WritableCellFormat cellFormat = new WritableCellFormat(cellFontHeading);
             cellFormat.setBorder(Border.ALL, BorderLineStyle.THIN,Colour.BLACK);
             cellFormat.setWrap(true);
             cellFormat.setAlignment(jxl.format.Alignment.CENTRE);
             cellFormat.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
             
             WritableFont cellFontData = new WritableFont(WritableFont.TIMES, 12);
             cellFontData.setColour(Colour.BLACK);
             WritableCellFormat cellFormat1 = new WritableCellFormat(cellFontData);
             cellFormat1.setBorder(Border.ALL, BorderLineStyle.THIN,Colour.BLACK);
             cellFormat1.setWrap(true);
             cellFormat1.setAlignment(jxl.format.Alignment.CENTRE);
             cellFormat1.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
              
             WritableFont cellFontName = new WritableFont(WritableFont.TIMES, 12);
             cellFontName.setColour(Colour.BLACK);
             WritableCellFormat cellFormatName=new WritableCellFormat(cellFontName);
             cellFormatName.setBorder(Border.ALL, BorderLineStyle.THIN,Colour.BLACK);
             cellFormatName.setWrap(true);
             cellFormatName.setAlignment(jxl.format.Alignment.LEFT);
             cellFormatName.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
             
             WritableFont cellFontHead = new WritableFont(WritableFont.TIMES, 14);
             cellFontHead.setBoldStyle(WritableFont.BOLD);
             cellFontHead.setColour(Colour.BLACK);
             WritableCellFormat cellFormatHead = new WritableCellFormat(cellFontHeading);
           //  cellFormatHead.setBorder(Border.ALL, BorderLineStyle.THIN,Colour.BLACK);
             cellFormatHead.setAlignment(jxl.format.Alignment.CENTRE);
             cellFormatHead.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);
             
               
               Label labelhead1=new Label(7, 3, department,cellFormatHead);
               Label labelhead2=new Label(7, 2, "INSTITUTE OF ENGINEERING AND SCIENCE",cellFormatHead);
               Label labelhead3=new Label(7, 1, "IPS ACADEMY INDORE",cellFormatHead);
               Label labelhead4=new Label(7, 4, "RESULT ANALYSIS",cellFormatHead);
               Label labelhead5=new Label(1, 6, "Course/Branch: BE / " + branch.toUpperCase()  ,cellFormatHead);
               Label labelhead6=new Label(5, 6, "Year/Sem : " + yearexcel + " / " + semexcel    ,cellFormatHead);
               Label labelhead7=new Label(11, 6, "Batch : " + batch    ,cellFormatHead);
               Label labelhead8=new Label(15, 6, "Date : "     ,cellFormatHead);
               
               mysheet.addCell(labelhead1);
               mysheet.addCell(labelhead2);
               mysheet.addCell(labelhead3);
               mysheet.addCell(labelhead4);
               mysheet.addCell(labelhead5);
               mysheet.addCell(labelhead6);
               mysheet.addCell(labelhead7);
               mysheet.addCell(labelhead8);
  
               switch(tsubjects+psubjects){
              
           case 7:   { 
               
               sub1= session.getAttribute("sub1").toString();
               sub2= session.getAttribute("sub2").toString();
               sub3= session.getAttribute("sub3").toString();
               sub4= session.getAttribute("sub4").toString();
               sub5= session.getAttribute("sub5").toString();
               sub6= session.getAttribute("sub6").toString();
               sub7= session.getAttribute("sub7").toString();
             
             mysheet.setColumnView(0, 6); 
             Label label0000=new Label(0, 7, "S.No",cellFormat);  
             mysheet.setColumnView(1, 18);
             Label label0=new Label(1, 7, "ROLL NO",cellFormat);
             mysheet.setColumnView(2, 24);
             Label label1=new Label(2, 7, "NAME",cellFormat);
             Label label4=new Label(3, 7, sub1,cellFormat);
             Label label5=new Label(4, 7, sub2,cellFormat);
             Label label6=new Label(5, 7, sub3,cellFormat);
             Label label7=new Label(6, 7, sub4,cellFormat);
             Label label8=new Label(7, 7, sub5,cellFormat);
             Label label9=new Label(8, 7, sub6,cellFormat);
             Label label10=new Label(9, 7, sub7,cellFormat);
             Label label20=new Label(10, 7, "SGPA",cellFormat);
             Label label21=new Label(11, 7, "CGPA",cellFormat);
             mysheet.setColumnView(12, 18);
             Label label22=new Label(12, 7, "RESULT",cellFormat);

             mysheet.addCell(label0000);
             mysheet.addCell(label0);
             mysheet.addCell(label1);
             mysheet.addCell(label4);
             mysheet.addCell(label5);
             mysheet.addCell(label6);
             mysheet.addCell(label7);
             mysheet.addCell(label8);
             mysheet.addCell(label9);
             mysheet.addCell(label10);
             mysheet.addCell(label20);
             mysheet.addCell(label21);
             mysheet.addCell(label22);
             
             
             
                int i=7;
                
                   
             for(ReadHtml r : myresultlist)
              {
                 i++;    
                Label label000=new Label(0, i, Integer.valueOf(i-7).toString(),cellFormat1);
                Label label00=new Label(1, i, r.getRollno(),cellFormat1);
                Label label01=new Label(2, i, r.getName(),cellFormatName);
                Label label04=new Label(3, i, r.getSub1(),cellFormat1);
                Label label05=new Label(4, i, r.getSub2(),cellFormat1);
                Label label06=new Label(5, i, r.getSub3(),cellFormat1);
                Label label07=new Label(6, i, r.getSub4(),cellFormat1);
                Label label08=new Label(7, i, r.getSub5(),cellFormat1);
                Label label09=new Label(8, i, r.getSub6(),cellFormat1);
                Label label010=new Label(9, i, r.getSub7(),cellFormat1);
                Label label015=new Label(10, i, r.getSgpa(),cellFormat1);
                Label label016=new Label(11, i, r.getCgpa(),cellFormat1);
                Label label017=new Label(12, i, r.getResult(),cellFormat1);
                mysheet.addCell(label000);
                mysheet.addCell(label00);
                mysheet.addCell(label01);
                mysheet.addCell(label04);
                mysheet.addCell(label05);
                mysheet.addCell(label06);
                mysheet.addCell(label07);
                mysheet.addCell(label08);
                mysheet.addCell(label09);
                mysheet.addCell(label010);
                mysheet.addCell(label015);
                mysheet.addCell(label016);
                mysheet.addCell(label017);
             }
              
              out.println("<script type=\"text/javascript\">");
              out.println("alert('Excel Sheet Created Succesfully');");
              out.println("</script>");
              %>
               <br><br><br><br><br><br><br><br>
       <span  style="float: center;"><strong><h2><b>•<%="Excel Sheet Created Successfully On Desktop ,"%> </b></h2></strong></span> 
        <br><span  style="float: center;"><strong><h2><b><%="By Name : Result_Sheet"%> </b></h2></strong></span> 
              <%
              myexel.write();
              myexel.close();
              break;
           }    
            
           case 8:   { 
               
               sub1= session.getAttribute("sub1").toString();
               sub2= session.getAttribute("sub2").toString();
               sub3= session.getAttribute("sub3").toString();
               sub4= session.getAttribute("sub4").toString();
               sub5= session.getAttribute("sub5").toString();
               sub6= session.getAttribute("sub6").toString();
               sub7= session.getAttribute("sub7").toString();
               sub8= session.getAttribute("sub8").toString();
             
             mysheet.setColumnView(0, 6); 
             Label label0000=new Label(0, 7, "S.No",cellFormat);  
             mysheet.setColumnView(1, 18);
             Label label0=new Label(1, 7, "ROLL NO",cellFormat);
             mysheet.setColumnView(2, 24);
             Label label1=new Label(2, 7, "NAME",cellFormat);
             Label label4=new Label(3, 7, sub1,cellFormat);
             Label label5=new Label(4, 7, sub2,cellFormat);
             Label label6=new Label(5, 7, sub3,cellFormat);
             Label label7=new Label(6, 7, sub4,cellFormat);
             Label label8=new Label(7, 7, sub5,cellFormat);
             Label label9=new Label(8, 7, sub6,cellFormat);
             Label label10=new Label(9, 7, sub7,cellFormat);
             Label label11=new Label(10, 7, sub8,cellFormat);
             Label label20=new Label(11, 7, "SGPA",cellFormat);
             Label label21=new Label(12, 7, "CGPA",cellFormat);
             mysheet.setColumnView(13, 18);
             Label label22=new Label(13, 7, "RESULT",cellFormat);

             mysheet.addCell(label0000);
             mysheet.addCell(label0);
             mysheet.addCell(label1);
             mysheet.addCell(label4);
             mysheet.addCell(label5);
             mysheet.addCell(label6);
             mysheet.addCell(label7);
             mysheet.addCell(label8);
             mysheet.addCell(label9);
             mysheet.addCell(label10);
             mysheet.addCell(label11);
             mysheet.addCell(label20);
             mysheet.addCell(label21);
             mysheet.addCell(label22);
             
             
             
                int i=7;
                
                   
             for(ReadHtml r : myresultlist)
              {
                 i++;    
                Label label000=new Label(0, i, Integer.valueOf(i-7).toString(),cellFormat1);
                Label label00=new Label(1, i, r.getRollno(),cellFormat1);
                Label label01=new Label(2, i, r.getName(),cellFormatName);
                Label label04=new Label(3, i, r.getSub1(),cellFormat1);
                Label label05=new Label(4, i, r.getSub2(),cellFormat1);
                Label label06=new Label(5, i, r.getSub3(),cellFormat1);
                Label label07=new Label(6, i, r.getSub4(),cellFormat1);
                Label label08=new Label(7, i, r.getSub5(),cellFormat1);
                Label label09=new Label(8, i, r.getSub6(),cellFormat1);
                Label label010=new Label(9, i, r.getSub7(),cellFormat1);
                Label label011=new Label(10, i, r.getSub8(),cellFormat1);
                Label label015=new Label(11, i, r.getSgpa(),cellFormat1);
                Label label016=new Label(12, i, r.getCgpa(),cellFormat1);
                Label label017=new Label(13, i, r.getResult(),cellFormat1);
                mysheet.addCell(label000);
                mysheet.addCell(label00);
                mysheet.addCell(label01);
                mysheet.addCell(label04);
                mysheet.addCell(label05);
                mysheet.addCell(label06);
                mysheet.addCell(label07);
                mysheet.addCell(label08);
                mysheet.addCell(label09);
                mysheet.addCell(label010);
                mysheet.addCell(label011);
                mysheet.addCell(label015);
                mysheet.addCell(label016);
                mysheet.addCell(label017);
             }
               
              out.println("<script type=\"text/javascript\">");
              out.println("alert('Excel Sheet Created Succesfully');");
              out.println("</script>");
              %>
                <br><br><br><br><br><br><br><br>
       <span  style="float: center;"><strong><h2><b>•<%="Excel Sheet Created Successfully On Desktop ,"%> </b></h2></strong></span> 
        <br><span  style="float: center;"><strong><h2><b><%="By Name : Result_Sheet"%> </b></h2></strong></span> 
              <%
              myexel.write();
              myexel.close();break;
           }   
            
           case 9:   { 
               
               sub1= session.getAttribute("sub1").toString();
               sub2= session.getAttribute("sub2").toString();
               sub3= session.getAttribute("sub3").toString();
               sub4= session.getAttribute("sub4").toString();
               sub5= session.getAttribute("sub5").toString();
               sub6= session.getAttribute("sub6").toString();
               sub7= session.getAttribute("sub7").toString();
               sub8= session.getAttribute("sub8").toString();
               sub9= session.getAttribute("sub9").toString();
             
             mysheet.setColumnView(0, 6); 
             Label label0000=new Label(0, 7, "S.No",cellFormat);  
             mysheet.setColumnView(1, 18);
             Label label0=new Label(1, 7, "ROLL NO",cellFormat);
             mysheet.setColumnView(2, 24);
             Label label1=new Label(2, 7, "NAME",cellFormat);
             Label label4=new Label(3, 7, sub1,cellFormat);
             Label label5=new Label(4, 7, sub2,cellFormat);
             Label label6=new Label(5, 7, sub3,cellFormat);
             Label label7=new Label(6, 7, sub4,cellFormat);
             Label label8=new Label(7, 7, sub5,cellFormat);
             Label label9=new Label(8, 7, sub6,cellFormat);
             Label label10=new Label(9, 7, sub7,cellFormat);
             Label label11=new Label(10, 7, sub8,cellFormat);
             Label label12=new Label(11, 7, sub9,cellFormat);
             Label label20=new Label(12, 7, "SGPA",cellFormat);
             Label label21=new Label(13, 7, "CGPA",cellFormat);
             mysheet.setColumnView(14, 18);
             Label label22=new Label(14, 7, "RESULT",cellFormat);

             mysheet.addCell(label0000);
             mysheet.addCell(label0);
             mysheet.addCell(label1);
             mysheet.addCell(label4);
             mysheet.addCell(label5);
             mysheet.addCell(label6);
             mysheet.addCell(label7);
             mysheet.addCell(label8);
             mysheet.addCell(label9);
             mysheet.addCell(label10);
             mysheet.addCell(label11);
             mysheet.addCell(label12);
             mysheet.addCell(label20);
             mysheet.addCell(label21);
             mysheet.addCell(label22);
             
             
             
                int i=7;
                
                   
             for(ReadHtml r : myresultlist)
              {
                 i++;    
                Label label000=new Label(0, i, Integer.valueOf(i-7).toString(),cellFormat1);
                Label label00=new Label(1, i, r.getRollno(),cellFormat1);
                Label label01=new Label(2, i, r.getName(),cellFormatName);
                Label label04=new Label(3, i, r.getSub1(),cellFormat1);
                Label label05=new Label(4, i, r.getSub2(),cellFormat1);
                Label label06=new Label(5, i, r.getSub3(),cellFormat1);
                Label label07=new Label(6, i, r.getSub4(),cellFormat1);
                Label label08=new Label(7, i, r.getSub5(),cellFormat1);
                Label label09=new Label(8, i, r.getSub6(),cellFormat1);
                Label label010=new Label(9, i, r.getSub7(),cellFormat1);
                Label label011=new Label(10, i, r.getSub8(),cellFormat1);
                Label label012=new Label(11, i, r.getSub9(),cellFormat1);
                Label label015=new Label(12, i, r.getSgpa(),cellFormat1);
                Label label016=new Label(13, i, r.getCgpa(),cellFormat1);
                Label label017=new Label(14, i, r.getResult(),cellFormat1);
                mysheet.addCell(label000);
                mysheet.addCell(label00);
                mysheet.addCell(label01);
                mysheet.addCell(label04);
                mysheet.addCell(label05);
                mysheet.addCell(label06);
                mysheet.addCell(label07);
                mysheet.addCell(label08);
                mysheet.addCell(label09);
                mysheet.addCell(label010);
                mysheet.addCell(label011);
                mysheet.addCell(label012);
                mysheet.addCell(label015);
                mysheet.addCell(label016);
                mysheet.addCell(label017);
             }
              
              out.println("<script type=\"text/javascript\">");
              out.println("alert('Excel Sheet Created Succesfully');");
              out.println("</script>");
              %>
              <br><br><br><br><br><br><br><br>
       <span  style="float: center;"><strong><h2><b>•<%="Excel Sheet Created Successfully On Desktop ,"%> </b></h2></strong></span> 
        <br><span  style="float: center;"><strong><h2><b><%="By Name : Result_Sheet"%> </b></h2></strong></span> 
              <%
              myexel.write();
              
              
              myexel.close();
              break;
           }   
            
           case 10:   { 
               
               sub1= session.getAttribute("sub1").toString();
               sub2= session.getAttribute("sub2").toString();
               sub3= session.getAttribute("sub3").toString();
               sub4= session.getAttribute("sub4").toString();
               sub5= session.getAttribute("sub5").toString();
               sub6= session.getAttribute("sub6").toString();
               sub7= session.getAttribute("sub7").toString();
               sub8= session.getAttribute("sub8").toString();
               sub9= session.getAttribute("sub9").toString();
               sub10= session.getAttribute("sub10").toString();
             
             mysheet.setColumnView(0, 6); 
             Label label0000=new Label(0, 7, "S.No",cellFormat);  
             mysheet.setColumnView(1, 18);
             Label label0=new Label(1, 7, "ROLL NO",cellFormat);
             mysheet.setColumnView(2, 24);
             Label label1=new Label(2, 7, "NAME",cellFormat);
             Label label4=new Label(3, 7, sub1,cellFormat);
             Label label5=new Label(4, 7, sub2,cellFormat);
             Label label6=new Label(5, 7, sub3,cellFormat);
             Label label7=new Label(6, 7, sub4,cellFormat);
             Label label8=new Label(7, 7, sub5,cellFormat);
             Label label9=new Label(8, 7, sub6,cellFormat);
             Label label10=new Label(9, 7, sub7,cellFormat);
             Label label11=new Label(10, 7, sub8,cellFormat);
             Label label12=new Label(11, 7, sub9,cellFormat);
             Label label13=new Label(12, 7, sub10,cellFormat);
             Label label20=new Label(13, 7, "SGPA",cellFormat);
             Label label21=new Label(14, 7, "CGPA",cellFormat);
             mysheet.setColumnView(15, 18);
             Label label22=new Label(15, 7, "RESULT",cellFormat);

             mysheet.addCell(label0000);
             mysheet.addCell(label0);
             mysheet.addCell(label1);
             mysheet.addCell(label4);
             mysheet.addCell(label5);
             mysheet.addCell(label6);
             mysheet.addCell(label7);
             mysheet.addCell(label8);
             mysheet.addCell(label9);
             mysheet.addCell(label10);
             mysheet.addCell(label11);
             mysheet.addCell(label12);
             mysheet.addCell(label13);
             mysheet.addCell(label20);
             mysheet.addCell(label21);
             mysheet.addCell(label22);
             
             
             
                int i=7;
                
                   
             for(ReadHtml r : myresultlist)
              {
                 i++;    
                Label label000=new Label(0, i, Integer.valueOf(i-7).toString(),cellFormat1);
                Label label00=new Label(1, i, r.getRollno(),cellFormat1);
                Label label01=new Label(2, i, r.getName(),cellFormatName);
                Label label04=new Label(3, i, r.getSub1(),cellFormat1);
                Label label05=new Label(4, i, r.getSub2(),cellFormat1);
                Label label06=new Label(5, i, r.getSub3(),cellFormat1);
                Label label07=new Label(6, i, r.getSub4(),cellFormat1);
                Label label08=new Label(7, i, r.getSub5(),cellFormat1);
                Label label09=new Label(8, i, r.getSub6(),cellFormat1);
                Label label010=new Label(9, i, r.getSub7(),cellFormat1);
                Label label011=new Label(10, i, r.getSub8(),cellFormat1);
                Label label012=new Label(11, i, r.getSub9(),cellFormat1);
                Label label013=new Label(12, i, r.getSub10(),cellFormat1);
                Label label015=new Label(13, i, r.getSgpa(),cellFormat1);
                Label label016=new Label(14, i, r.getCgpa(),cellFormat1);
                Label label017=new Label(15, i, r.getResult(),cellFormat1);
                mysheet.addCell(label000);
                mysheet.addCell(label00);
                mysheet.addCell(label01);
                mysheet.addCell(label04);
                mysheet.addCell(label05);
                mysheet.addCell(label06);
                mysheet.addCell(label07);
                mysheet.addCell(label08);
                mysheet.addCell(label09);
                mysheet.addCell(label010);
                mysheet.addCell(label011);
                mysheet.addCell(label012);
                mysheet.addCell(label013);
                mysheet.addCell(label015);
                mysheet.addCell(label016);
                mysheet.addCell(label017);
             } 
             
              out.println("<script type=\"text/javascript\">");
              out.println("alert('Excel Sheet Created Succesfully');");
              out.println("</script>");
              %>
               <br><br><br><br><br><br><br><br>
       <span  style="float: center;"><strong><h2><b>•<%="Excel Sheet Created Successfully On Desktop ,"%> </b></h2></strong></span> 
        <br><span  style="float: center;"><strong><h2><b><%="By Name : Result_Sheet"%> </b></h2></strong></span> 
              <%
              myexel.write();
              myexel.close();break;
           }   
            
           case 11:  { 
               
               sub1= session.getAttribute("sub1").toString();
               sub2= session.getAttribute("sub2").toString();
               sub3= session.getAttribute("sub3").toString();
               sub4= session.getAttribute("sub4").toString();
               sub5= session.getAttribute("sub5").toString();
               sub6= session.getAttribute("sub6").toString();
               sub7= session.getAttribute("sub7").toString();
               sub8= session.getAttribute("sub8").toString();
               sub9= session.getAttribute("sub9").toString();
               sub10= session.getAttribute("sub10").toString();
               sub11= session.getAttribute("sub11").toString();
             
             mysheet.setColumnView(0, 6); 
             Label label0000=new Label(0, 7, "S.No",cellFormat);  
             mysheet.setColumnView(1, 18);
             Label label0=new Label(1, 7, "ROLL NO",cellFormat);
             mysheet.setColumnView(2, 24);
             Label label1=new Label(2, 7, "NAME",cellFormat);
             Label label4=new Label(3, 7, sub1,cellFormat);
             Label label5=new Label(4, 7, sub2,cellFormat);
             Label label6=new Label(5, 7, sub3,cellFormat);
             Label label7=new Label(6, 7, sub4,cellFormat);
             Label label8=new Label(7, 7, sub5,cellFormat);
             Label label9=new Label(8, 7, sub6,cellFormat);
             Label label10=new Label(9, 7, sub7,cellFormat);
             Label label11=new Label(10, 7, sub8,cellFormat);
             Label label12=new Label(11, 7, sub9,cellFormat);
             Label label13=new Label(12, 7, sub10,cellFormat);
             Label label14=new Label(13, 7, sub11,cellFormat);
             Label label20=new Label(14, 7, "SGPA",cellFormat);
             Label label21=new Label(15, 7, "CGPA",cellFormat);
             mysheet.setColumnView(16, 18);
             Label label22=new Label(16, 7, "RESULT",cellFormat);

             mysheet.addCell(label0000);
             mysheet.addCell(label0);
             mysheet.addCell(label1);
             mysheet.addCell(label4);
             mysheet.addCell(label5);
             mysheet.addCell(label6);
             mysheet.addCell(label7);
             mysheet.addCell(label8);
             mysheet.addCell(label9);
             mysheet.addCell(label10);
             mysheet.addCell(label11);
             mysheet.addCell(label12);
             mysheet.addCell(label13);
             mysheet.addCell(label14);
             mysheet.addCell(label20);
             mysheet.addCell(label21);
             mysheet.addCell(label22);
             
             
             
                int i=7;
                
                   
             for(ReadHtml r : myresultlist)
              {
                 i++;    
                Label label000=new Label(0, i, Integer.valueOf(i-7).toString(),cellFormat1);
                Label label00=new Label(1, i, r.getRollno(),cellFormat1);
                Label label01=new Label(2, i, r.getName(),cellFormatName);
                Label label04=new Label(3, i, r.getSub1(),cellFormat1);
                Label label05=new Label(4, i, r.getSub2(),cellFormat1);
                Label label06=new Label(5, i, r.getSub3(),cellFormat1);
                Label label07=new Label(6, i, r.getSub4(),cellFormat1);
                Label label08=new Label(7, i, r.getSub5(),cellFormat1);
                Label label09=new Label(8, i, r.getSub6(),cellFormat1);
                Label label010=new Label(9, i, r.getSub7(),cellFormat1);
                Label label011=new Label(10, i, r.getSub8(),cellFormat1);
                Label label012=new Label(11, i, r.getSub9(),cellFormat1);
                Label label013=new Label(12, i, r.getSub10(),cellFormat1);
                Label label014=new Label(13, i, r.getSub11(),cellFormat1);
                Label label015=new Label(14, i, r.getSgpa(),cellFormat1);
                Label label016=new Label(15, i, r.getCgpa(),cellFormat1);
                Label label017=new Label(16, i, r.getResult(),cellFormat1);
                mysheet.addCell(label000);
                mysheet.addCell(label00);
                mysheet.addCell(label01);
                mysheet.addCell(label04);
                mysheet.addCell(label05);
                mysheet.addCell(label06);
                mysheet.addCell(label07);
                mysheet.addCell(label08);
                mysheet.addCell(label09);
                mysheet.addCell(label010);
                mysheet.addCell(label011);
                mysheet.addCell(label012);
                mysheet.addCell(label013);
                mysheet.addCell(label014);
                mysheet.addCell(label015);
                mysheet.addCell(label016);
                mysheet.addCell(label017);
             }
             out.println("<script type=\"text/javascript\">");
              out.println("alert('Excel Sheet Created Succesfully');");
              out.println("</script>");
              %>
               <br><br><br><br><br><br><br><br>
       <span  style="float: center;"><strong><h2><b>•<%="Excel Sheet Created Successfully On Desktop ,"%> </b></h2></strong></span> 
        <br><span  style="float: center;"><strong><h2><b><%="By Name : Result_Sheet"%> </b></h2></strong></span> 
              <%
              myexel.write();
              myexel.close();break;
           }   
            
           case 12: { 
               
               sub1= session.getAttribute("sub1").toString();
               sub2= session.getAttribute("sub2").toString();
               sub3= session.getAttribute("sub3").toString();
               sub4= session.getAttribute("sub4").toString();
               sub5= session.getAttribute("sub5").toString();
               sub6= session.getAttribute("sub6").toString();
               sub7= session.getAttribute("sub7").toString();
               sub8= session.getAttribute("sub8").toString();
               sub9= session.getAttribute("sub9").toString();
               sub10= session.getAttribute("sub10").toString();
               sub11= session.getAttribute("sub11").toString();
               sub12= session.getAttribute("sub12").toString();
             
             mysheet.setColumnView(0, 6); 
             Label label0000=new Label(0, 7, "S.No",cellFormat);  
             mysheet.setColumnView(1, 18);
             Label label0=new Label(1, 7, "ROLL NO",cellFormat);
             mysheet.setColumnView(2, 24);
             Label label1=new Label(2, 7, "NAME",cellFormat);
             Label label4=new Label(3, 7, sub1,cellFormat);
             Label label5=new Label(4, 7, sub2,cellFormat);
             Label label6=new Label(5, 7, sub3,cellFormat);
             Label label7=new Label(6, 7, sub4,cellFormat);
             Label label8=new Label(7, 7, sub5,cellFormat);
             Label label9=new Label(8, 7, sub6,cellFormat);
             Label label10=new Label(9, 7, sub7,cellFormat);
             Label label11=new Label(10, 7, sub8,cellFormat);
             Label label12=new Label(11, 7, sub9,cellFormat);
             Label label13=new Label(12, 7, sub10,cellFormat);
             Label label14=new Label(13, 7, sub11,cellFormat);
             Label label15=new Label(14, 7, sub12,cellFormat);
             Label label20=new Label(15, 7, "SGPA",cellFormat);
             Label label21=new Label(16, 7, "CGPA",cellFormat);
             mysheet.setColumnView(17, 18);
             Label label22=new Label(17, 7, "RESULT",cellFormat);

             mysheet.addCell(label0000);
             mysheet.addCell(label0);
             mysheet.addCell(label1);
             mysheet.addCell(label4);
             mysheet.addCell(label5);
             mysheet.addCell(label6);
             mysheet.addCell(label7);
             mysheet.addCell(label8);
             mysheet.addCell(label9);
             mysheet.addCell(label10);
             mysheet.addCell(label11);
             mysheet.addCell(label12);
             mysheet.addCell(label13);
             mysheet.addCell(label14);
             mysheet.addCell(label15);
             mysheet.addCell(label20);
             mysheet.addCell(label21);
             mysheet.addCell(label22);
             
             
             
                int i=7;
                
                   
             for(ReadHtml r : myresultlist)
              {
                 i++;    
                Label label000=new Label(0, i, Integer.valueOf(i-7).toString(),cellFormat1);
                Label label00=new Label(1, i, r.getRollno(),cellFormat1);
                Label label01=new Label(2, i, r.getName(),cellFormatName);
                Label label04=new Label(3, i, r.getSub1(),cellFormat1);
                Label label05=new Label(4, i, r.getSub2(),cellFormat1);
                Label label06=new Label(5, i, r.getSub3(),cellFormat1);
                Label label07=new Label(6, i, r.getSub4(),cellFormat1);
                Label label08=new Label(7, i, r.getSub5(),cellFormat1);
                Label label09=new Label(8, i, r.getSub6(),cellFormat1);
                Label label010=new Label(9, i, r.getSub7(),cellFormat1);
                Label label011=new Label(10, i, r.getSub8(),cellFormat1);
                Label label012=new Label(11, i, r.getSub9(),cellFormat1);
                Label label013=new Label(12, i, r.getSub10(),cellFormat1);
                Label label014=new Label(13, i, r.getSub11(),cellFormat1);
                Label label018=new Label(14, i, r.getSub12(),cellFormat1);
                Label label015=new Label(15, i, r.getSgpa(),cellFormat1);
                Label label016=new Label(16, i, r.getCgpa(),cellFormat1);
                Label label017=new Label(17, i, r.getResult(),cellFormat1);
                mysheet.addCell(label000);
                mysheet.addCell(label00);
                mysheet.addCell(label01);
                mysheet.addCell(label04);
                mysheet.addCell(label05);
                mysheet.addCell(label06);
                mysheet.addCell(label07);
                mysheet.addCell(label08);
                mysheet.addCell(label09);
                mysheet.addCell(label010);
                mysheet.addCell(label011);
                mysheet.addCell(label012);
                mysheet.addCell(label013);
                mysheet.addCell(label014);
                mysheet.addCell(label015);
                mysheet.addCell(label016);
                mysheet.addCell(label017);
                mysheet.addCell(label018);
             }
             out.println("<script type=\"text/javascript\">");
              out.println("alert('Excel Sheet Created Succesfully');");
              out.println("</script>");
              %>
              <br><br><br><br><br><br><br><br>
       <span  style="float: center;"><strong><h2><b>•<%="Excel Sheet Created Successfully On Desktop ,"%> </b></h2></strong></span> 
        <br><span  style="float: center;"><strong><h2><b><%="By Name : Result_Sheet"%> </b></h2></strong></span> 
              <%
              myexel.write();
              myexel.close();break;
           }   
              
            
           case 13: { 
               
               sub1= session.getAttribute("sub1").toString();
               sub2= session.getAttribute("sub2").toString();
               sub3= session.getAttribute("sub3").toString();
               sub4= session.getAttribute("sub4").toString();
               sub5= session.getAttribute("sub5").toString();
               sub6= session.getAttribute("sub6").toString();
               sub7= session.getAttribute("sub7").toString();
               sub8= session.getAttribute("sub8").toString();
               sub9= session.getAttribute("sub9").toString();
               sub10= session.getAttribute("sub10").toString();
               sub11= session.getAttribute("sub11").toString();
               sub12= session.getAttribute("sub12").toString();
               sub13= session.getAttribute("sub13").toString();
             
             mysheet.setColumnView(0, 6); 
             Label label0000=new Label(0, 7, "S.No",cellFormat);  
             mysheet.setColumnView(1, 18);
             Label label0=new Label(1, 7, "ROLL NO",cellFormat);
             mysheet.setColumnView(2, 24);
             Label label1=new Label(2, 7, "NAME",cellFormat);
             Label label4=new Label(3, 7, sub1,cellFormat);
             Label label5=new Label(4, 7, sub2,cellFormat);
             Label label6=new Label(5, 7, sub3,cellFormat);
             Label label7=new Label(6, 7, sub4,cellFormat);
             Label label8=new Label(7, 7, sub5,cellFormat);
             Label label9=new Label(8, 7, sub6,cellFormat);
             Label label10=new Label(9, 7, sub7,cellFormat);
             Label label11=new Label(10, 7, sub8,cellFormat);
             Label label12=new Label(11, 7, sub9,cellFormat);
             Label label13=new Label(12, 7, sub10,cellFormat);
             Label label14=new Label(13, 7, sub11,cellFormat);
             Label label15=new Label(14, 7, sub12,cellFormat);
             Label label16=new Label(15, 7, sub13,cellFormat);
             Label label20=new Label(16, 7, "SGPA",cellFormat);
             Label label21=new Label(17, 7, "CGPA",cellFormat);
             mysheet.setColumnView(18, 18);
             Label label22=new Label(18, 7, "RESULT",cellFormat);

             mysheet.addCell(label0000);
             mysheet.addCell(label0);
             mysheet.addCell(label1);
             mysheet.addCell(label4);
             mysheet.addCell(label5);
             mysheet.addCell(label6);
             mysheet.addCell(label7);
             mysheet.addCell(label8);
             mysheet.addCell(label9);
             mysheet.addCell(label10);
             mysheet.addCell(label11);
             mysheet.addCell(label12);
             mysheet.addCell(label13);
             mysheet.addCell(label14);
             mysheet.addCell(label15);
             mysheet.addCell(label16);
             mysheet.addCell(label20);
             mysheet.addCell(label21);
             mysheet.addCell(label22);
             
             
             
                int i=7;
                
                   
             for(ReadHtml r : myresultlist)
              {
                 i++;    
                Label label000=new Label(0, i, Integer.valueOf(i-7).toString(),cellFormat1);
                Label label00=new Label(1, i, r.getRollno(),cellFormat1);
                Label label01=new Label(2, i, r.getName(),cellFormatName);
                Label label04=new Label(3, i, r.getSub1(),cellFormat1);
                Label label05=new Label(4, i, r.getSub2(),cellFormat1);
                Label label06=new Label(5, i, r.getSub3(),cellFormat1);
                Label label07=new Label(6, i, r.getSub4(),cellFormat1);
                Label label08=new Label(7, i, r.getSub5(),cellFormat1);
                Label label09=new Label(8, i, r.getSub6(),cellFormat1);
                Label label010=new Label(9, i, r.getSub7(),cellFormat1);
                Label label011=new Label(10, i, r.getSub8(),cellFormat1);
                Label label012=new Label(11, i, r.getSub9(),cellFormat1);
                Label label013=new Label(12, i, r.getSub10(),cellFormat1);
                Label label014=new Label(13, i, r.getSub11(),cellFormat1);
                Label label015=new Label(14, i, r.getSub12(),cellFormat1);
                Label label016=new Label(15, i, r.getSub13(),cellFormat1);
                Label label017=new Label(16, i, r.getSgpa(),cellFormat1);
                Label label018=new Label(17, i, r.getCgpa(),cellFormat1);
                Label label019=new Label(18, i, r.getResult(),cellFormat1);
                mysheet.addCell(label000);
                mysheet.addCell(label00);
                mysheet.addCell(label01);
                mysheet.addCell(label04);
                mysheet.addCell(label05);
                mysheet.addCell(label06);
                mysheet.addCell(label07);
                mysheet.addCell(label08);
                mysheet.addCell(label09);
                mysheet.addCell(label010);
                mysheet.addCell(label011);
                mysheet.addCell(label012);
                mysheet.addCell(label013);
                mysheet.addCell(label014);
                mysheet.addCell(label015);
                mysheet.addCell(label016);
                mysheet.addCell(label017);
                mysheet.addCell(label018);
                mysheet.addCell(label019);
             }
              out.println("<script type=\"text/javascript\">");
              out.println("alert('Excel Sheet Created Succesfully');");
              out.println("</script>");
              %>
             <br><br><br><br><br><br><br><br>
       <span  style="float: center;"><strong><h2><b>•<%="Excel Sheet Created Successfully On Desktop ,"%> </b></h2></strong></span> 
        <br><span  style="float: center;"><strong><h2><b><%="By Name : Result_Sheet"%> </b></h2></strong></span> 
              
              <%
              myexel.write();
              myexel.close();break;
           }   
              
            
           case 14:   { 
               
               sub1= session.getAttribute("sub1").toString();
               sub2= session.getAttribute("sub2").toString();
               sub3= session.getAttribute("sub3").toString();
               sub4= session.getAttribute("sub4").toString();
               sub5= session.getAttribute("sub5").toString();
               sub6= session.getAttribute("sub6").toString();
               sub7= session.getAttribute("sub7").toString();
               sub8= session.getAttribute("sub8").toString();
               sub9= session.getAttribute("sub9").toString();
               sub10= session.getAttribute("sub10").toString();
               sub11= session.getAttribute("sub11").toString();
               sub12= session.getAttribute("sub12").toString();
               sub13= session.getAttribute("sub13").toString();
               sub14= session.getAttribute("sub14").toString();
             
             mysheet.setColumnView(0, 6); 
             Label label0000=new Label(0, 7, "S.No",cellFormat);  
             mysheet.setColumnView(1, 18);
             Label label0=new Label(1, 7, "ROLL NO",cellFormat);
             mysheet.setColumnView(2, 24);
             Label label1=new Label(2, 7, "NAME",cellFormat);
             Label label4=new Label(3, 7, sub1,cellFormat);
             Label label5=new Label(4, 7, sub2,cellFormat);
             Label label6=new Label(5, 7, sub3,cellFormat);
             Label label7=new Label(6, 7, sub4,cellFormat);
             Label label8=new Label(7, 7, sub5,cellFormat);
             Label label9=new Label(8, 7, sub6,cellFormat);
             Label label10=new Label(9, 7, sub7,cellFormat);
             Label label11=new Label(10, 7, sub8,cellFormat);
             Label label12=new Label(11, 7, sub9,cellFormat);
             Label label13=new Label(12, 7, sub10,cellFormat);
             Label label14=new Label(13, 7, sub11,cellFormat);
             Label label15=new Label(14, 7, sub12,cellFormat);
             Label label16=new Label(15, 7, sub13,cellFormat);
             Label label17=new Label(16, 7, sub14,cellFormat);
             Label label20=new Label(17, 7, "SGPA",cellFormat);
             Label label21=new Label(18, 7, "CGPA",cellFormat);
             mysheet.setColumnView(19, 18);
             Label label22=new Label(19, 7, "RESULT",cellFormat);

             mysheet.addCell(label0000);
             mysheet.addCell(label0);
             mysheet.addCell(label1);
             mysheet.addCell(label4);
             mysheet.addCell(label5);
             mysheet.addCell(label6);
             mysheet.addCell(label7);
             mysheet.addCell(label8);
             mysheet.addCell(label9);
             mysheet.addCell(label10);
             mysheet.addCell(label11);
             mysheet.addCell(label12);
             mysheet.addCell(label13);
             mysheet.addCell(label14);
             mysheet.addCell(label15);
             mysheet.addCell(label16);
             mysheet.addCell(label17);
             mysheet.addCell(label20);
             mysheet.addCell(label21);
             mysheet.addCell(label22);
             
             
             
                int i=7;
                
                   
             for(ReadHtml r : myresultlist)
              {
                 i++;    
                Label label000=new Label(0, i, Integer.valueOf(i-7).toString(),cellFormat1);
                Label label00=new Label(1, i, r.getRollno(),cellFormat1);
                Label label01=new Label(2, i, r.getName(),cellFormatName);
                Label label04=new Label(3, i, r.getSub1(),cellFormat1);
                Label label05=new Label(4, i, r.getSub2(),cellFormat1);
                Label label06=new Label(5, i, r.getSub3(),cellFormat1);
                Label label07=new Label(6, i, r.getSub4(),cellFormat1);
                Label label08=new Label(7, i, r.getSub5(),cellFormat1);
                Label label09=new Label(8, i, r.getSub6(),cellFormat1);
                Label label010=new Label(9, i, r.getSub7(),cellFormat1);
                Label label011=new Label(10, i, r.getSub8(),cellFormat1);
                Label label012=new Label(11, i, r.getSub9(),cellFormat1);
                Label label013=new Label(12, i, r.getSub10(),cellFormat1);
                Label label014=new Label(13, i, r.getSub11(),cellFormat1);
                Label label015=new Label(14, i, r.getSub12(),cellFormat1);
                Label label016=new Label(15, i, r.getSub13(),cellFormat1);
                Label label020=new Label(16, i, r.getSub14(),cellFormat1);
                Label label017=new Label(17, i, r.getSgpa(),cellFormat1);
                Label label018=new Label(18, i, r.getCgpa(),cellFormat1);
                Label label019=new Label(19, i, r.getResult(),cellFormat1);
                mysheet.addCell(label000);
                mysheet.addCell(label00);
                mysheet.addCell(label01);
                mysheet.addCell(label04);
                mysheet.addCell(label05);
                mysheet.addCell(label06);
                mysheet.addCell(label07);
                mysheet.addCell(label08);
                mysheet.addCell(label09);
                mysheet.addCell(label010);
                mysheet.addCell(label011);
                mysheet.addCell(label012);
                mysheet.addCell(label013);
                mysheet.addCell(label014);
                mysheet.addCell(label015);
                mysheet.addCell(label016);
                mysheet.addCell(label017);
                mysheet.addCell(label018);
                mysheet.addCell(label019);
                mysheet.addCell(label020);
             }
              out.println("<script type=\"text/javascript\">");
              out.println("alert('Excel Sheet Created Succesfully');");
              out.println("</script>");
              %>
              <br><br><br><br><br><br><br><br>
       <span  style="float: center;"><strong><h2><b>•<%="Excel Sheet Created Successfully On Desktop ,"%> </b></h2></strong></span> 
        <br><span  style="float: center;"><strong><h2><b><%="By Name : Result_Sheet"%> </b></h2></strong></span> 
              
              <%
              myexel.write();
              myexel.close();break;
           }  

           case 15:  { 
               
               sub1= session.getAttribute("sub1").toString();
               sub2= session.getAttribute("sub2").toString();
               sub3= session.getAttribute("sub3").toString();
               sub4= session.getAttribute("sub4").toString();
               sub5= session.getAttribute("sub5").toString();
               sub6= session.getAttribute("sub6").toString();
               sub7= session.getAttribute("sub7").toString();
               sub8= session.getAttribute("sub8").toString();
               sub9= session.getAttribute("sub9").toString();
               sub10= session.getAttribute("sub10").toString();
               sub11= session.getAttribute("sub11").toString();
               sub12= session.getAttribute("sub12").toString();
               sub13= session.getAttribute("sub13").toString();
               sub14= session.getAttribute("sub14").toString();
               sub15= session.getAttribute("sub15").toString();
             
             mysheet.setColumnView(0, 6); 
             Label label0000=new Label(0, 7, "S.No",cellFormat);  
             mysheet.setColumnView(1, 18);
             Label label0=new Label(1, 7, "ROLL NO",cellFormat);
             mysheet.setColumnView(2, 24);
             Label label1=new Label(2, 7, "NAME",cellFormat);
             Label label4=new Label(3, 7, sub1,cellFormat);
             Label label5=new Label(4, 7, sub2,cellFormat);
             Label label6=new Label(5, 7, sub3,cellFormat);
             Label label7=new Label(6, 7, sub4,cellFormat);
             Label label8=new Label(7, 7, sub5,cellFormat);
             Label label9=new Label(8, 7, sub6,cellFormat);
             Label label10=new Label(9, 7, sub7,cellFormat);
             Label label11=new Label(10, 7, sub8,cellFormat);
             Label label12=new Label(11, 7, sub9,cellFormat);
             Label label13=new Label(12, 7, sub10,cellFormat);
             Label label14=new Label(13, 7, sub11,cellFormat);
             Label label15=new Label(14, 7, sub12,cellFormat);
             Label label16=new Label(15, 7, sub13,cellFormat);
             Label label17=new Label(16, 7, sub14,cellFormat);
             Label label18=new Label(17, 7, sub15,cellFormat);
             Label label20=new Label(18, 7, "SGPA",cellFormat);
             Label label21=new Label(19, 7, "CGPA",cellFormat);
             mysheet.setColumnView(20, 18);
             Label label22=new Label(20, 7, "RESULT",cellFormat);

             mysheet.addCell(label0000);
             mysheet.addCell(label0);
             mysheet.addCell(label1);
             mysheet.addCell(label4);
             mysheet.addCell(label5);
             mysheet.addCell(label6);
             mysheet.addCell(label7);
             mysheet.addCell(label8);
             mysheet.addCell(label9);
             mysheet.addCell(label10);
             mysheet.addCell(label11);
             mysheet.addCell(label12);
             mysheet.addCell(label13);
             mysheet.addCell(label14);
             mysheet.addCell(label15);
             mysheet.addCell(label16);
             mysheet.addCell(label17);
             mysheet.addCell(label18);
             mysheet.addCell(label20);
             mysheet.addCell(label21);
             mysheet.addCell(label22);
             
             
             
                int i=7;
                
                   
             for(ReadHtml r : myresultlist)
              {
                 i++;    
                Label label000=new Label(0, i, Integer.valueOf(i-7).toString(),cellFormat1);
                Label label00=new Label(1, i, r.getRollno(),cellFormat1);
                Label label01=new Label(2, i, r.getName(),cellFormatName);
                Label label04=new Label(3, i, r.getSub1(),cellFormat1);
                Label label05=new Label(4, i, r.getSub2(),cellFormat1);
                Label label06=new Label(5, i, r.getSub3(),cellFormat1);
                Label label07=new Label(6, i, r.getSub4(),cellFormat1);
                Label label08=new Label(7, i, r.getSub5(),cellFormat1);
                Label label09=new Label(8, i, r.getSub6(),cellFormat1);
                Label label010=new Label(9, i, r.getSub7(),cellFormat1);
                Label label011=new Label(10, i, r.getSub8(),cellFormat1);
                Label label012=new Label(11, i, r.getSub9(),cellFormat1);
                Label label013=new Label(12, i, r.getSub10(),cellFormat1);
                Label label014=new Label(13, i, r.getSub11(),cellFormat1);
                Label label015=new Label(14, i, r.getSub12(),cellFormat1);
                Label label016=new Label(15, i, r.getSub13(),cellFormat1);
                Label label020=new Label(16, i, r.getSub14(),cellFormat1);
                Label label021=new Label(17, i, r.getSub15(),cellFormat1);
                Label label017=new Label(18, i, r.getSgpa(),cellFormat1);
                Label label018=new Label(19, i, r.getCgpa(),cellFormat1);
                Label label019=new Label(20, i, r.getResult(),cellFormat1);
                mysheet.addCell(label000);
                mysheet.addCell(label00);
                mysheet.addCell(label01);
                mysheet.addCell(label04);
                mysheet.addCell(label05);
                mysheet.addCell(label06);
                mysheet.addCell(label07);
                mysheet.addCell(label08);
                mysheet.addCell(label09);
                mysheet.addCell(label010);
                mysheet.addCell(label011);
                mysheet.addCell(label012);
                mysheet.addCell(label013);
                mysheet.addCell(label014);
                mysheet.addCell(label015);
                mysheet.addCell(label016);
                mysheet.addCell(label017);
                mysheet.addCell(label018);
                mysheet.addCell(label019);
                mysheet.addCell(label020);
                mysheet.addCell(label021);

             }
             out.println("<script type=\"text/javascript\">");
              out.println("alert('Excel Sheet Created Succesfully');");
              out.println("</script>");
              %>
               <br><br><br><br><br><br><br><br>
       <span  style="float: center;"><strong><h2><b>•<%="Excel Sheet Created Successfully On Desktop ,"%> </b></h2></strong></span> 
        <br><span  style="float: center;"><strong><h2><b><%="By Name : Result_Sheet"%> </b></h2></strong></span> 
              
              <%
              myexel.write();
              myexel.close();break;
           }    
            
           case 16:   { 
               
               sub1= session.getAttribute("sub1").toString();
               sub2= session.getAttribute("sub2").toString();
               sub3= session.getAttribute("sub3").toString();
               sub4= session.getAttribute("sub4").toString();
               sub5= session.getAttribute("sub5").toString();
               sub6= session.getAttribute("sub6").toString();
               sub7= session.getAttribute("sub7").toString();
               sub8= session.getAttribute("sub8").toString();
               sub9= session.getAttribute("sub9").toString();
               sub10= session.getAttribute("sub10").toString();
               sub11= session.getAttribute("sub11").toString();
               sub12= session.getAttribute("sub12").toString();
               sub13= session.getAttribute("sub13").toString();
               sub14= session.getAttribute("sub14").toString();
               sub15= session.getAttribute("sub15").toString();
               sub16= session.getAttribute("sub16").toString();
             
             mysheet.setColumnView(0, 6); 
             Label label0000=new Label(0, 7, "S.No",cellFormat);  
             mysheet.setColumnView(1, 18);
             Label label0=new Label(1, 7, "ROLL NO",cellFormat);
             mysheet.setColumnView(2, 24);
             Label label1=new Label(2, 7, "NAME",cellFormat);
             Label label4=new Label(3, 7, sub1,cellFormat);
             Label label5=new Label(4, 7, sub2,cellFormat);
             Label label6=new Label(5, 7, sub3,cellFormat);
             Label label7=new Label(6, 7, sub4,cellFormat);
             Label label8=new Label(7, 7, sub5,cellFormat);
             Label label9=new Label(8, 7, sub6,cellFormat);
             Label label10=new Label(9, 7, sub7,cellFormat);
             Label label11=new Label(10, 7, sub8,cellFormat);
             Label label12=new Label(11, 7, sub9,cellFormat);
             Label label13=new Label(12, 7, sub10,cellFormat);
             Label label14=new Label(13, 7, sub11,cellFormat);
             Label label15=new Label(14, 7, sub12,cellFormat);
             Label label16=new Label(15, 7, sub13,cellFormat);
             Label label17=new Label(16, 7, sub14,cellFormat);
             Label label18=new Label(17, 7, sub15,cellFormat);
             Label label19=new Label(18, 7, sub16,cellFormat);
             Label label20=new Label(19, 7, "SGPA",cellFormat);
             Label label21=new Label(20, 7, "CGPA",cellFormat);
             mysheet.setColumnView(21, 18);
             Label label22=new Label(21, 7, "RESULT",cellFormat);

             mysheet.addCell(label0000);
             mysheet.addCell(label0);
             mysheet.addCell(label1);
             mysheet.addCell(label4);
             mysheet.addCell(label5);
             mysheet.addCell(label6);
             mysheet.addCell(label7);
             mysheet.addCell(label8);
             mysheet.addCell(label9);
             mysheet.addCell(label10);
             mysheet.addCell(label11);
             mysheet.addCell(label12);
             mysheet.addCell(label13);
             mysheet.addCell(label14);
             mysheet.addCell(label15);
             mysheet.addCell(label16);
             mysheet.addCell(label17);
             mysheet.addCell(label18);
             mysheet.addCell(label19);
             mysheet.addCell(label20);
             mysheet.addCell(label21);
             mysheet.addCell(label22);
             
             
             
                int i=7;
                
                   
             for(ReadHtml r : myresultlist)
              {
                 i++;    
                Label label000=new Label(0, i, Integer.valueOf(i-7).toString(),cellFormat1);
                Label label00=new Label(1, i, r.getRollno(),cellFormat1);
                Label label01=new Label(2, i, r.getName(),cellFormatName);
                Label label04=new Label(3, i, r.getSub1(),cellFormat1);
                Label label05=new Label(4, i, r.getSub2(),cellFormat1);
                Label label06=new Label(5, i, r.getSub3(),cellFormat1);
                Label label07=new Label(6, i, r.getSub4(),cellFormat1);
                Label label08=new Label(7, i, r.getSub5(),cellFormat1);
                Label label09=new Label(8, i, r.getSub6(),cellFormat1);
                Label label010=new Label(9, i, r.getSub7(),cellFormat1);
                Label label011=new Label(10, i, r.getSub8(),cellFormat1);
                Label label012=new Label(11, i, r.getSub9(),cellFormat1);
                Label label013=new Label(12, i, r.getSub10(),cellFormat1);
                Label label014=new Label(13, i, r.getSub11(),cellFormat1);
                Label label015=new Label(14, i, r.getSub12(),cellFormat1);
                Label label016=new Label(15, i, r.getSub13(),cellFormat1);
                Label label020=new Label(16, i, r.getSub14(),cellFormat1);
                Label label021=new Label(17, i, r.getSub15(),cellFormat1);
                Label label022=new Label(18, i, r.getSub16(),cellFormat1);
                Label label017=new Label(19, i, r.getSgpa(),cellFormat1);
                Label label018=new Label(20, i, r.getCgpa(),cellFormat1);
                Label label019=new Label(21, i, r.getResult(),cellFormat1);
                mysheet.addCell(label000);
                mysheet.addCell(label00);
                mysheet.addCell(label01);
                mysheet.addCell(label04);
                mysheet.addCell(label05);
                mysheet.addCell(label06);
                mysheet.addCell(label07);
                mysheet.addCell(label08);
                mysheet.addCell(label09);
                mysheet.addCell(label010);
                mysheet.addCell(label011);
                mysheet.addCell(label012);
                mysheet.addCell(label013);
                mysheet.addCell(label014);
                mysheet.addCell(label015);
                mysheet.addCell(label016);
                mysheet.addCell(label017);
                mysheet.addCell(label018);
                mysheet.addCell(label019);
                mysheet.addCell(label020);
                mysheet.addCell(label021);
                mysheet.addCell(label022);

             }
              out.println("<script type=\"text/javascript\">");
              out.println("alert('Excel Sheet Created Succesfully');");
              out.println("</script>");
              %>
               <br><br><br><br><br><br><br><br>
       <span  style="float: center;"><strong><h2><b>•<%="Excel Sheet Created Successfully On Desktop ,"%> </b></h2></strong></span> 
        <br><span  style="float: center;"><strong><h2><b><%="By Name : Result_Sheet"%> </b></h2></strong></span> 
              
              <%
              myexel.close();
              break;
           }  
            
               }
              in1 = new FileInputStream(f);
              IOUtils.copyLarge(in1, out1);  
          }
               catch(IOException e)
            {

                out.println(e);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('File not Found');");
                out.println("</script>");
       %>
          
       <br><br><br><br><br><br><br><br>
       <span  style="float: center;"><strong><h2><b>•<%="File not Found"%><br><br> <%="Access is denied ,please try again later"%> </b></h2></strong></span> 
          <%    
            }                         
               catch(Exception e)
            {

                out.println(e);
                out.println("<script type=\"text/javascript\">");
//                out.println("alert('The process cannot access the file because it is being used by another process');");
                out.println("</script>");
       %>
          
       <br><br><br><br><br><br><br><br>
       <span  style="float: center;"><strong><h2><b>•<%="Excel Sheet Not Generated."%><br><br> <%="Something went wrong, please try again later"%> </b></h2></strong></span> 
          <%    
            }
           finally
           {
              IOUtils.closeQuietly(out1);
              IOUtils.closeQuietly(in1);
              IOUtils.closeQuietly(out1);
       
           }     
            
        %>
       
    </body>
</html>
