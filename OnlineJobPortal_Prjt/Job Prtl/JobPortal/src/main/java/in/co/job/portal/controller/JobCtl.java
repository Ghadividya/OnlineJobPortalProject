package in.co.job.portal.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import in.co.job.portal.bean.BaseBean;
import in.co.job.portal.bean.JobBean;
import in.co.job.portal.bean.UserBean;
import in.co.job.portal.exception.ApplicationException;
import in.co.job.portal.exception.DuplicateRecordException;
import in.co.job.portal.model.JobModel;
import in.co.job.portal.model.UserModel;
import in.co.job.portal.util.DataUtility;
import in.co.job.portal.util.DataValidator;
import in.co.job.portal.util.PropertyReader;
import in.co.job.portal.util.ServletUtility;

/**
 * Servlet implementation class JobCtl
 */
@WebServlet(name="JobCtl",urlPatterns={"/ctl/JobCtl"})
public class JobCtl extends BaseCtl {
	private static final long serialVersionUID = 1L;
       
	private static Logger log = Logger.getLogger(JobCtl.class);
	/**
	 * Loads list and other data required to display at HTML form
	 * 
	 * @param request
	 */
	
	/**
	 * Validate input Data Entered By User
	 * 
	 * @param request
	 * @return
	 */
	@Override
	protected boolean validate(HttpServletRequest request) {

		log.debug("JobCtl Method validate Started");

		boolean pass = true;

		 

		if (DataValidator.isNull(request.getParameter("cName"))) {
			request.setAttribute("cName",
					PropertyReader.getValue("error.require", "Company Name"));
			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("language"))) {
			request.setAttribute("language",
					PropertyReader.getValue("error.require", "Language"));
			pass = false;
		}

		
		if (DataValidator.isNull(request.getParameter("pDate"))) {
			request.setAttribute("pDate",
					PropertyReader.getValue("error.require", "Date"));
			pass = false;
		}
		
		if (DataValidator.isNull(request.getParameter("address"))) {
			request.setAttribute("address",
					PropertyReader.getValue("error.require", "Address"));
			pass = false;
		}
		
		if (DataValidator.isNull(request.getParameter("description"))) {
			request.setAttribute("description",
					PropertyReader.getValue("error.require", "Description"));
			pass = false;
		}
		
		log.debug("JobCtl Method validate Ended");

		return pass;
	}
	
	@Override
	protected BaseBean populateBean(HttpServletRequest request) {

		log.debug("JobCtl Method populatebean Started");

		JobBean bean = new JobBean();

		bean.setId(DataUtility.getLong(request.getParameter("id")));


		bean.setCompanyName(DataUtility.getString(request	.getParameter("cName")));

		bean.setLanguage(DataUtility.getString(request.getParameter("language")));

		bean.setAddress(DataUtility.getString(request.getParameter("address")));

		bean.setDescription(DataUtility.getString(request.getParameter("description")));

		bean.setPostDate(DataUtility.getDate(request.getParameter("pDate")));
		
		HttpSession session=request.getSession();
		UserBean uBean=(UserBean)session.getAttribute("user");
		bean.setPostByRecId(uBean.getLogin());

		populateDTO(bean, request);

		log.debug("JobCtl Method populatebean Ended");

		return bean;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.debug("JobCtl Method doGet Started");

		String op = DataUtility.getString(request.getParameter("operation"));
        // get model
        
		JobModel model = new JobModel();
        
		long id = DataUtility.getLong(request.getParameter("id"));
       
		if (id > 0 || op != null) {
          
            
			JobBean bean;
            try {
                bean = model.findByPK(id);
             
                ServletUtility.setBean(bean, request);
            
            } catch (ApplicationException e) {
                log.error(e);
            
                ServletUtility.handleException(e, request, response);
                return;
            }
        }

        ServletUtility.forward(getView(), request, response);
        log.debug("JobCtl Method doGet Ended");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		log.debug("JobCtl Method doPost Started");
        String op = DataUtility.getString(request.getParameter("operation"));
        // get model
        JobModel model = new JobModel();
        long id = DataUtility.getLong(request.getParameter("id"));
        if (OP_SAVE.equalsIgnoreCase(op)) {
        	JobBean bean = (JobBean) populateBean(request);
            
            try {
                if (id > 0){
                 model.update(bean);
                
                    ServletUtility.setSuccessMessage("Data is successfully Updated", request);
                } else {
                    long pk = model.add(bean);
                   // bean.setId(pk);
                    ServletUtility.setSuccessMessage("Data is successfully saved",request);
                }
              
               
            } catch (ApplicationException e) {
                log.error(e);
                ServletUtility.handleException(e, request, response);
                return;
            } catch (DuplicateRecordException e) {
                ServletUtility.setBean(bean, request);
                ServletUtility.setErrorMessage("Job id already exists", request);
            }
            ServletUtility.forward(getView(), request, response);
        } else if (OP_DELETE.equalsIgnoreCase(op)) {

        	JobBean bean = (JobBean) populateBean(request);
            try {
                model.delete(bean);
                ServletUtility.redirect(JPView.JOB_LIST_CTL, request,
                        response);
                return;
            } catch (ApplicationException e) {
                log.error(e);
                ServletUtility.handleException(e, request, response);
              
                return;
            }

        } else if (OP_CANCEL.equalsIgnoreCase(op)) {
        	ServletUtility.redirect(JPView.JOB_LIST_CTL, request, response);
        	
        }else if (OP_RESET.equalsIgnoreCase(op)) {
    		ServletUtility.redirect(JPView.JOB_CTL, request, response);
    		return;
    }
    				
    		
        ServletUtility.forward(getView(), request, response);
        

        log.debug("JobCtl Method doPostEnded");
	}

	@Override
	protected String getView() {
		// TODO Auto-generated method stub
		return JPView.JOB_VIEW;
	}

}
