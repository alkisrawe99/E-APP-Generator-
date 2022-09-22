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
              <li class="breadcrumb-item active">Add Categories</li>
            </ol>
          </div>
        </div>
      </div>
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-sm-3"></div>

            <div class="col-sm-6">
                <form role="form" action="{{url('')}}/add_category" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="_token" value="<?php echo csrf_token(); ?>">
                    <h1>Categories</h1>
                    <div class="card-body">
                        <div class="form-group">
                        <label for="category">Categories</label>
                        <input type="text" class="form-control" id="category" placeholder="Enter Category" name="name">
</br>
                        <input type="file" class="form-control" multiple="true" name="image"  />
                               
                        </br>
    
                    <div class="card-footer">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>

            <div class="col-sm-3"></div>
        </div>      
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
  @extends('footer')

</body>
</html>
