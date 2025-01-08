package steps;

import io.cucumber.java.pt.Dado;
import io.cucumber.java.pt.Entao;
import io.cucumber.java.pt.Quando;
import io.restassured.http.ContentType;
import maps.LoginMap;
import utils.RestUtils;

import java.util.Map;

public class LoginSteps {

    @Dado("que tenha um payload valido da api de login")
    public void queTenhaUmPayloadValidoDaApiDeLogin() {
        LoginMap.initLogin();
    }

    @Quando("envio uma requisicao do tipo POST de login")
    public void envioUmaRequisicaoDoTipoPOSTDeLogin() {
        RestUtils.post(LoginMap.getLogin(), ContentType.JSON, "auth");
    }

    @Entao("armazeno o token que recebo do response de login")
    public void armazenoOTokenQueReceboDoResponseDeLogin() {
        LoginMap.token = RestUtils.getResponse().jsonPath().get("token");
    }

    @Dado("que tenha um payload valido da api de login com as seguintes informacoes")
    public void queTenhaUmPayloadValidoDaApiDeLoginComAsSeguintesInformacoes(Map<String, String> map) {
        LoginMap.initLogin();
        LoginMap.getLogin().putAll(map);
    }

    @Dado("que tenha realizado o login com dados validos")
    public void queTenhaRealizadoOLoginComDadosValidos() {
        queTenhaUmPayloadValidoDaApiDeLogin();
        envioUmaRequisicaoDoTipoPOSTDeLogin();
        armazenoOTokenQueReceboDoResponseDeLogin();
    }

}
