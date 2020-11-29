/**
 * 
 */
package com.grocery.service;

import java.util.Date;
import java.util.List;
import com.grocery.entity.DailyReport1;
import com.grocery.entity.MonthlyReport;
import com.grocery.entity.OrderEntity;
import com.grocery.entity.YearlyReport;
import com.grocery.form.ReportJsonForm;
/**
 * @author Gaurav Mahajan
 *
 */
public interface IAdminReportService {

	List<DailyReport1> getReportByCurrent();

	List<DailyReport1> getReportBySearch(ReportJsonForm reportJsonForm);

	List<MonthlyReport> getReportByMonth(String year);

	List<YearlyReport> getReportByYear(String year);

	List<OrderEntity> viewReportBydate(Date date);
}
