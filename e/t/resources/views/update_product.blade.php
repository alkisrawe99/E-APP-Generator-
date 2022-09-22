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
                            <li class="breadcrumb-item active"> -> update prodact</li>
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
                <h3 class="card-title">prodact Table</h3>

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
                    <th>ID</th>
                      <th>name</th>
                      <th>name_category</th>
                      <th>price</th>
                      <th>Description</th>
                      <th>size</th>
                      <th>image</th>

                    </tr>
                  </thead>
                  <tbody>
                  <form role="form" action="{{url('')}}/update_prodact" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="_token" value="<?php echo csrf_token(); ?>">
                    <tr>
                      <td></td>
                      <td><?php  echo "$items->id"; ?> <input type=hidden name=id value="<?php  echo "$items->id"; ?>"></td>
                      <td><input type=text name=name value="<?php  echo "$items->name"; ?>"> </td>
                      <td>
                      <select id="category" name="category">
                                   
                                   @foreach ($ca as $i) 
                                <option value=" <?php  echo "$i->name"; ?>"> <?php  echo "$i->name"; ?></option>
                                   @endforeach
                                   </select> </td>
                      <td><input type=number name=price value="<?php  echo "$items->price"; ?>"> </td>
                      <td><input type=text name=Description value="<?php  echo "$items->Description"; ?>"> </td>
                      <td><input type=text name=size value="<?php  echo "$items->size"; ?>"> </td>
                      <td><input type=file name=image value="<?php  echo "$items->image"; ?>"> </td>
                      <td><button type="submit" class="btn btn-primary">Submit</button> </td>
                    </tr>
                  
                  </form>    
                               
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