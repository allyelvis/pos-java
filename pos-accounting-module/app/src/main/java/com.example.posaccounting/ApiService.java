import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.Path;

import java.util.List;

public interface ApiService {
    @POST("/pos/products")
    Call<Product> createProduct(@Body Product product);

    @GET("/pos/products")
    Call<List<Product>> getProducts();

    @POST("/accounting/invoices")
    Call<Invoice> createInvoice(@Body Invoice invoice);

    @GET("/accounting/invoices")
    Call<List<Invoice>> getInvoices();
}
