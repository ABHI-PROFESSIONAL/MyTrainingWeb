<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.mysql.cj.jdbc.DatabaseMetaData"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.Databse.dbconnect" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>first jsp page</title>
    <!-- Compiled and minified CSS -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
    <style>
        .training-btn {
            border-radius: 0px;
            padding-top: 0px;
    		padding-bottom: 0px;
        }

        .training-btn span {

            position: relative;
            top: -3px;
            font-size: 16px;

        }

        .material-icons {
            position: relative;
            top: 6px;
        }

    </style>


</head>

<body>
    <%
dbconnect method  = new dbconnect();
Connection con = method.getDbConnection();
PreparedStatement stmt=con.prepareStatement("Select * from training");
try{
ResultSet rs=stmt.executeQuery();  
%>
    <div class="container">
        <table id="training_table" class="table table-hover table-sm display">
            <thead>
                <tr>
                    <th>Training Id</th>
                    <th> Name</th>
                    <th>Technology</th>
                    <th>Start Date</th>
                    <th>End Date</th>
                    <th>Edit</th>
                    <th>Delete</th>

                </tr>
            </thead>

            <tbody>
                <%
while(rs.next()){  %>

                <tr>
                    <td><% out.print(rs.getInt("training_id"));%></td>
                    <td><% out.print(rs.getString("training_name")); %></td>
                    <td><% out.print(rs.getString("technology"));%></td>
                    <td><% out.print(rs.getString("sdate"));%></td>
                    <td><% out.print(rs.getString("edate"));%></td>
                    <td><button class="btn btn-primary training-btn" data-toggle="modal" data-target="#editmodal"><span><i class="material-icons left">cloud</i> Edit</span></button></td>
                    <td><button class="btn btn-danger training-btn" data-toggle="modal" data-target="#deletemodal"><span><i class="material-icons left">cloud</i> Delete</span></button></td>
                    <!--model for edit-->
                    <div class="modal fade" id="editmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header bg-primary">
                                    <h5 class="modal-title" id="">Edit</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="edit.jsp">

                                        <div class="form-group">
                                            <label for="training_name">Training Name</label>
                                            <input type="email" class="form-control" id="training_name" aria-describedby="emailHelp" placeholder="Training Name" value="<% out.print(rs.getString("training_name")); %>">
                                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputPassword1">Password</label>
                                            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                        </div>
                                        <div class="form-group form-check">
                                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                            <label class="form-check-label" for="exampleCheck1">Check me out</label>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                                    <a href="delete.jsp?id=<%out.print(rs.getInt("training_id")); %>" class="btn btn-danger"> Confirm Delete</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--model for edit-->
                    <div class="modal fade" id="editmodel" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header bg-warning">
                                    <h5 class="modal-title" id="">Edit</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    ....
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                                    <a href="delete.jsp?id=<%out.print(rs.getInt("training_id")); %>" class="btn btn-danger"> Confirm Delete</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--                   model for delete-->
                    <div class="modal fade" id="deletemodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header bg-warning">
                                    <h5 class="modal-title" id="">Alert</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    Do you really want to delete <b><% out.print(rs.getString("training_name")); %></b> Training on <b><% out.print(rs.getString("technology")); %></b> Technology.
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
                                    <a href="delete.jsp?id=<%out.print(rs.getInt("training_id")); %>" class="btn btn-danger"> Confirm Delete</a>
                                </div>
                            </div>
                        </div>
                    </div>

                </tr>

                <%
}  
}catch(Exception ex){
	out.print(ex);
}
%>
            </tbody>
        </table>
    </div>


    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
    <script>
        $('#myModal').on('shown.bs.modal', function() {
            $('#myInput').trigger('focus')
        });
        $(document).ready(function() {
            $('#training_table').DataTable({
                "paging": true,
                "ordering": true,
                "info": false,
                "columnDefs": [{
                        "orderable": false,
                        "targets": [-1, -2]
                    },
                    {
                        "searchable": false,
                        "targets": [-1, -2]
                    }
                ]
            });
        });

    </script>
</body>

</html>
