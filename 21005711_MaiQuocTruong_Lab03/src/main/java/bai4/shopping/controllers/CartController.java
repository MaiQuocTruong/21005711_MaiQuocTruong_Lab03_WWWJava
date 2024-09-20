package bai4.shopping.controllers;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import bai4.shopping.dao.ProductDAO;
import bai4.shopping.daoImpl.ProductDAOImp;
import bai4.shopping.entities.ItemCart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

@WebServlet(urlPatterns = {"/cart", "/cart*"})
public class CartController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Resource(name = "jdbc/shopping")
    private DataSource dataSource;

    private ProductDAO productDAO;

    public CartController() {
        super();
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        productDAO = new ProductDAOImp(this.dataSource);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") != null ? request.getParameter("action") : "";
        switch(action) {
            case "buy":
                doGetBuy(request, response);
                break;
            case "remove":
                doGetRemove(request, response);
                break;
            case "checkout": // Xử lý hành động checkout
                doGetCheckout(request, response);
                break;
            default:
                doGetDisplayCart(request, response);
                break;
        }
    }

    /**
     * Display Cart
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void doGetDisplayCart(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("views/cart/index.jsp").forward(request, response);
    }

    /**
     * Remove cart
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void doGetRemove(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<ItemCart> cart = (List<ItemCart>) session.getAttribute("cart");
        int index = isProductExisting(Integer.parseInt(request.getParameter("id")), cart);
        cart.remove(index);
        session.setAttribute("cart", cart);
        response.sendRedirect("cart");
    }

    /**
     * Buy product
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void doGetBuy(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<ItemCart> cart = null;

        if (session.getAttribute("cart") == null) {
            cart = new ArrayList<ItemCart>();
        } else {
            cart = (List<ItemCart>) session.getAttribute("cart");
        }

        int index = isProductExisting(Integer.parseInt(request.getParameter("id")), cart);
        if (index == -1) {
            cart.add(new ItemCart(productDAO.getById(Integer.parseInt(request.getParameter("id"))), 1));
        } else {
            int quantity = cart.get(index).getQuantity() + 1;
            cart.get(index).setQuantity(quantity);
        }
        session.setAttribute("cart", cart);

        response.sendRedirect("cart");
    }

    /**
     * Checkout cart
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void doGetCheckout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<ItemCart> cart = (List<ItemCart>) session.getAttribute("cart");
        String totalParam = request.getParameter("total"); // Lấy tổng tiền từ request
        double totalAmount = 0;

        if (totalParam != null) {
            totalAmount = Double.parseDouble(totalParam); // Chuyển đổi tổng tiền từ chuỗi sang số
        }

        if (cart != null && !cart.isEmpty()) {
            // Xử lý logic thanh toán tại đây (nếu cần)

            // Xóa giỏ hàng sau khi thanh toán thành công
            cart.clear();
            session.setAttribute("cart", cart); // Cập nhật giỏ hàng trống vào session
            request.setAttribute("message", "Checkout thành công! Bạn đã thanh toán thành công $" + totalAmount);
        } else {
            request.setAttribute("message", "Giỏ hàng của bạn đang trống.");
        }

        // Chuyển hướng đến trang hiển thị thông báo thanh toán thành công
        request.getRequestDispatcher("views/cart/checkout-success.jsp").forward(request, response);
    }


    /**
     * Check Product exist or not
     * @param id
     * @param cart
     * @return integer
     */
    private int isProductExisting(int id, List<ItemCart> cart) {
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getProduct().getId() == id) {
                return i;
            }
        }
        return -1;
    }
}
