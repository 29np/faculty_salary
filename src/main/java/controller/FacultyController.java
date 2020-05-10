package controller;

import bean.Faculty;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import service.FacultyService;
import service.impl.FacultyServiceImpl;
import util.Id_fac;
import util.Send_photoname;
import util.User;
import com.google.gson.Gson;



@Path("/login")
public class FacultyController
{
    Gson gson = new Gson();

    @POST
    @Path("/doop")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response addStudent(User user) {

        FacultyService facultyService = new FacultyServiceImpl();
        Faculty f = facultyService.login(user.getUsername());
        if(f.getPassword().equals(user.getPassword()) && f.getUsername().equals(user.getUsername()))
        {
            Id_fac id = new Id_fac();
            id.setId(f.getId());
            return Response.ok(gson.toJson(id),MediaType.APPLICATION_JSON).build();
        }
        else
        {
            Id_fac id = new Id_fac();
            id.setId("Error");
            return Response.ok(gson.toJson(id),MediaType.APPLICATION_JSON).build();
        }
    }
    @POST
    @Path("/getphoto")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response getphoto(Send_photoname user) {

        FacultyService facultyService = new FacultyServiceImpl();
        Faculty f = facultyService.login(user.getName());
            Send_photoname s = new Send_photoname();
            s.setName(f.getName());
            s.setPhoto(f.getPhoto());
            return Response.ok(gson.toJson(s),MediaType.APPLICATION_JSON).build();
    }

}
