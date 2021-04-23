package br.com.realequartz.mvc.mudi.api;

import br.com.realequartz.mvc.mudi.interceptor.InterceptadorDeAcessos;
import br.com.realequartz.mvc.mudi.interceptor.InterceptadorDeAcessos.Acesso;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequestMapping("acessos")
@RestController
public class AcessosRest {

    @GetMapping
    public List<Acesso> getAcessos(){
        return InterceptadorDeAcessos.acessos;
    }
}
