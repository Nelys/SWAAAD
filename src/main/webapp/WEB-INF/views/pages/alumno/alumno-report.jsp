<%@ page contentType="application/pdf"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="net.sf.jasperreports.engine.*"%>
<%@ page import="net.sf.jasperreports.engine.data.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%

	try {
		@SuppressWarnings("unchecked")
		List<Map<String, ?>> dataSource = (List<Map<String, ?>>) request.getAttribute("listaAlumnos");

		
		JRDataSource jrDataSource = new JRBeanCollectionDataSource(dataSource);

		String jrxFile = session.getServletContext().getRealPath("/resources/reports/AlumnoReport.jrxml");
		InputStream input = new FileInputStream(new File(jrxFile));
		JasperReport jasperReport = JasperCompileManager.compileReport(input);
		
		

		Map<String,Object> parameters=new HashMap<String,Object>();
		parameters.put("titulo","este es el titulo");
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, jrDataSource);
		
// 		String jrxFile2 = session.getServletContext().getRealPath("/resources/reports/AlumnoReport.jasper");
		
// 		String printFileName = JasperFillManager.fillReportToFile(jrxFile2, parameters, jrDataSource);
// 		JasperExportManager.exportReportToPdfFile(printFileName, "C://sample_report.pdf");

		JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
		response.getOutputStream().flush();
		response.getOutputStream().close();

	} catch (Exception e) {
		e.printStackTrace();
	}
%>