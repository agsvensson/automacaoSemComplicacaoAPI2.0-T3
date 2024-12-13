package plataformaFilmes;

import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.response.Response;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.Map;

public class PlataformaFilmesTest {

    static String token;
    String json;

    @Test
    public void validarLogin() {
        RestAssured.baseURI = "http://localhost:8080/";

        Response response = post(json, ContentType.JSON, "auth");

        assertEquals(200, response.getStatusCode());

        String token = response.jsonPath().get("token");
        System.out.println(token);
    }

    @BeforeAll
    public static void validarLoginMap() {
        String json = RestAssured.baseURI = "http://localhost:8080/";
        Map<String, String> map = new HashMap<>();
        map.put("email", "aluno@email.com");
        map.put("senha", "123456");

        Response response = post(map, ContentType.JSON, "auth");
        assertEquals(200, response.statusCode());
        token = response.jsonPath().get("token");
    }

    @Test
    public void validarConsutaCategorias() {
        Map<String, String> header = new HashMap<>();
        header.put("Authorization", "Bearer " + token);

        Response response = get(header, "categorias");
        assertEquals(200, response.statusCode());

        System.out.println(response.jsonPath().get().toString());
    }

    public static Response get(Map<String, String> header, String endpoint) {
        return RestAssured.given()
                .relaxedHTTPSValidation()
                .headers(header)
                .when()
                .get(endpoint)
                .then()
                .log().all()
                .extract().response();
    }

    public static Response post(Object json, ContentType contentType, String enpoint) {
        return RestAssured.given()
                .log().all()
                .relaxedHTTPSValidation()
                .contentType(contentType)
                .body(json)
                .when()
                .post(enpoint)
                .thenReturn();
//        pode substituir .thenReturn() por .then().extract().response()
    }

}
