package customer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dao.CustomerDao;
import util.LogUtil;

/**
 * 顧客情報のロジック
 */
public class CustomerLogic {

    /**
     * DAO経由で顧客情報をDBから取得する
     * @param id 取得する顧客情報のID
     * @return 顧客情報Bean
     */
    public CustomerBean load(int id) {
        LogUtil.println(this.getClass().getSimpleName() + "#load");

        CustomerDao customerDao = new CustomerDao();
        CustomerBean customer = customerDao.load(id);

        return customer;
    }

    /**
     * DAO経由で顧客情報をDBに追加する
     * @param customer 顧客情報Bean
     * @return エラーメッセージ(処理成功時、null)
     */
    public String add(CustomerBean customer) {
        LogUtil.println(this.getClass().getSimpleName() + "#add");

        String errorMsg = null;
        CustomerDao customerdao = new CustomerDao();
        String customer2 = customerdao.add(customer);

        errorMsg = customer2 ;



        return errorMsg;
    }

    /**
     * DAO経由でDBの顧客情報を更新する
     * @param customer 顧客情報Bean
     * @return エラーメッセージ(処理成功時、null)
     */
    public String update(CustomerBean customer) {
        LogUtil.println(this.getClass().getSimpleName() + "#update");

        CustomerDao customerDAO = new CustomerDao();
        String result = customerDAO.update(customer);

        return result;
    }
    /**
     * DAO経由でDBの顧客情報を削除する
     * @param customer 顧客情報Bean
     * @return エラーメッセージ(処理成功時、null)
     */
    public String delete(CustomerBean customer) {
        LogUtil.println(this.getClass().getSimpleName() + "#delete");

        String errorMsg = null;
        CustomerDao customerdao = new CustomerDao();
        String customer2 = customerdao.delete(customer.getId());

        errorMsg = customer2 ;



        return errorMsg;
    }

    /**
     * リクエスト内の顧客情報をセッションに顧客情報Beanとして設定する
     * @param request 顧客情報を含むリクエスト
     */
    public void setCustomerBeanFromRequestToSession(HttpServletRequest request) {
        LogUtil.println(this.getClass().getSimpleName() + "#setCustomerBeanFromRequestToSession");

        HttpSession session = request.getSession();
        CustomerBean customer = (CustomerBean) session.getAttribute("customer");
        if (customer == null) {
            customer = new CustomerBean();
        }

        String name = request.getParameter("name");
        String zip = request.getParameter("zip");
        String address1 = request.getParameter("address1");
        String address2 = request.getParameter("address2");
        String tel = request.getParameter("tel");
        String fax = request.getParameter("fax");
        String mail = request.getParameter("mail");

        System.out.println(name + zip + address1 + address2 + tel + fax + mail);

        customer.setName(name);
        customer.setZip(zip);
        customer.setAddress1(address1);
        customer.setAddress2(address2);
        customer.setTel(tel);
        customer.setFax(fax);
        customer.setEmail(mail);


        session.setAttribute("customer",customer);
    }}