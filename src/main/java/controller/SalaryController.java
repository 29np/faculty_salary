package controller;

import bean.Faculty;
import bean.Salary;
import com.google.gson.Gson;
import service.FacultyService;
import service.SalaryService;
import service.impl.FacultyServiceImpl;
import service.impl.SalaryServiceImpl;
import util.Get_date_year;
import util.Get_par;
import util.Send_details;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.net.URISyntaxException;
import java.util.List;

@Path("/sal")
public class SalaryController {

    private final Gson gson = new Gson();

    @POST
    @Path("/getall")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response getAll(Get_date_year dy) throws URISyntaxException {

        FacultyService facultyService = new FacultyServiceImpl();
        Faculty f = facultyService.login(dy.getUsername());
        SalaryService salaryService = new SalaryServiceImpl();
        List<Salary> sala = salaryService.getalldetails(f.getId());
        Send_details s = new Send_details();
        s.setSal(sala);
        s.setS(f.getSalary());
        return Response.ok(gson.toJson(s), MediaType.APPLICATION_JSON).build();
    }

    @POST
    @Path("/getparticular")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response getParticular(Get_date_year dy) throws URISyntaxException {

        SalaryService salaryService = new SalaryServiceImpl();
        FacultyService facultyService = new FacultyServiceImpl();
        Faculty f = facultyService.login(dy.getUsername());
        Salary s = (Salary) salaryService.getparticulardetails(f.getId(), dy.getMonthno(), dy.getYear());
        Get_par ret = new Get_par();
        ret.setS(s);
        ret.setSalary(f.getSalary());
        return Response.ok(gson.toJson(ret), MediaType.APPLICATION_JSON).build();
    }
}
