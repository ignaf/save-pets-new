package ar.edu.unlam.tallerweb1.controladores;

import ar.edu.unlam.tallerweb1.modelo.Refugio;
import ar.edu.unlam.tallerweb1.servicios.MapaService;
import ar.edu.unlam.tallerweb1.servicios.ServicioMascota;
import ar.edu.unlam.tallerweb1.servicios.ServicioRefugio;
import ar.edu.unlam.tallerweb1.servicios.ServicioUsuario;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.ui.ModelMap;

import javax.servlet.http.HttpServletRequest;

import java.util.ArrayList;
import java.util.List;

import static org.hamcrest.CoreMatchers.instanceOf;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

public class ControladorMascotaTest {
    @Mock
    private MapaService mapaService;
    @Mock
    private ServicioMascota servicioMascota;
    @Mock
    private ServicioRefugio servicioRefugio;
    @Mock
    private ServicioUsuario servicioUsuario;
    @Mock
    private HttpServletRequest request;

    @InjectMocks
    private ControladorMascotas controladorMascotas;

    private MockMvc mockMvc;

    @Before
    public void setup() {
        MockitoAnnotations.initMocks(this);
        mockMvc = MockMvcBuilders.standaloneSetup(controladorMascotas).build();
    }

    @Test
    public void asignarRefugioAUnaMascotaGet() throws Exception {
//        when(request.getSession().getAttribute("Rol") == "Admin").thenReturn(true);
//        when(controladorMascotas.esAdmin()).thenReturn(true);
        List<Refugio> refugios = new ArrayList<>();
        when(servicioRefugio.listarTodos()).thenReturn(refugios);

        mockMvc.perform(get("/asignarRefugio/{id}",1))
                .andExpect(status().isOk())
                .andExpect(view().name("asignarRefugio"))
                .andExpect(model().attribute("modelo", instanceOf(ModelMap.class)));

    }
}