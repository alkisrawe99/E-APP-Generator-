<!DOCTYPE html>
<html>

@extends('head')

<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

@extends('aside')

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Dashboard</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="{{ URL::to('/') }}/adminindex">Home</a></li>
                            <li class="breadcrumb-item active">Show Users</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.content-header -->


  <!-- /.row -->
  <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Users Table</h3>

                <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                    <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default"><i class="fas fa-search"></i></button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <thead>
                    <tr>
                    <th></th>
                      <th>name</th>
                      <th>Email</th>
                      <th>Password</th>
                      <th>phone</th>
                     

                    </tr>
                  </thead>
                  <tbody>
                  @foreach ($user as $i) 
                    <tr>
                      <td></td>
                      <td> <?php  echo "$i->name"; ?></td>
                      <td> <?php  echo "$i->email"; ?></td>
                      <td> <?php  echo "$i->password"; ?></td>
                      <td> <?php  echo "$i->phone"; ?></td>
                      <td><a href = {{"delete_user/".$i->id}}> delete</td>
                    </tr>
                    @endforeach
	                      
                               
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
        </div>
        <!-- /.row -->





        @extends('footer')

</body>

</html>