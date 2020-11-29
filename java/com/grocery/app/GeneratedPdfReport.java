package com.grocery.app;

import com.grocery.entity.OrderEntity;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.List;

@Component
public class GeneratedPdfReport {
	
	 private static final Logger logger = LoggerFactory.getLogger(GeneratedPdfReport.class);

	    public static ByteArrayInputStream citiesReport(List<OrderEntity> orders) {

	        Document document = new Document();
	        ByteArrayOutputStream out = new ByteArrayOutputStream();
	        
	     

	        try {

	            PdfPTable table = new PdfPTable(3);
	            table.setWidthPercentage(60);
	            table.setWidths(new int[]{3, 3, 3});

	            Font headFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD);

	            PdfPCell hcell;
	            hcell = new PdfPCell(new Phrase("Total Quantity", headFont));
	            hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
	            table.addCell(hcell);

	            hcell = new PdfPCell(new Phrase("Total Amount", headFont));
	            hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
	            table.addCell(hcell);

	            hcell = new PdfPCell(new Phrase("Payment Mode", headFont));
	            hcell.setHorizontalAlignment(Element.ALIGN_CENTER);
	            table.addCell(hcell);

	     
	            for (OrderEntity order : orders) {
	                PdfPCell cell;

	                cell = new PdfPCell(new Phrase(String.valueOf(order.getTotalQuantity())));
	                cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
	                cell.setHorizontalAlignment(Element.ALIGN_CENTER);
	                table.addCell(cell);

	                cell = new PdfPCell(new Phrase(String.valueOf(order.getTotalAmount())));
	                cell.setPaddingLeft(5);
	                cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
	                cell.setHorizontalAlignment(Element.ALIGN_LEFT);
	                table.addCell(cell);

	                cell = new PdfPCell(new Phrase(String.valueOf(order.getPaymentMode())));
	                cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
	                cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
	                cell.setPaddingRight(5);
	                table.addCell(cell);
	                table.setSpacingBefore(10);
	            }
	           OrderEntity o= orders.get(0);
	            PdfWriter.getInstance(document, out);
	            document.open();
	            document.addTitle("Report");
	            
	            Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
	            font.setSize(18);
	            font.setColor(BaseColor.BLUE);
	            
	            Paragraph p = new Paragraph("Customer Name:"+o.getCustomerEntity().getFirstName(),font);
	            p.setAlignment(Paragraph.ALIGN_CENTER);
	           
	           
	             document.add(p);
	           
	            document.add(table);
	            

	            document.close();

	        } catch (DocumentException ex) {

	            logger.error("Error occurred: {0}", ex);
	        }

	        return new ByteArrayInputStream(out.toByteArray());
	    }

}

