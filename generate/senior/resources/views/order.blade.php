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
                            <li class="breadcrumb-item active">Show categorys</li>
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
                <h3 class="card-title">order Table</h3>

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
                  @foreach ($show as $i) 
                    <tr>
                      <th>ID</th>
                      <td> <?php  echo "$i->id"; ?></td>
                    </tr>

                    <tr>
                      <th>id_user</th>
                      <td> <?php  echo "$i->id_user"; ?></td>
                    </tr>

                    <tr>
                      <th>appName</th>
                      <td> <?php  echo "$i->appName"; ?></td>
                    </tr>


                    <tr>
                      <th>companyName</th>
                      <td> <?php  echo "$i->companyName"; ?></td>
                    </tr>



                    <tr>
                      <th>phone</th>
                      <td> <?php  echo "$i->phone"; ?></td>
                    </tr>

                    <tr>
                      <th>location</th>
                      <td> <?php  echo "$i->location"; ?></td>
                    </tr>

                    <tr>
                      <th>domain</th>
                      <td> <?php  echo "$i->domain"; ?></td>
                    </tr>

                   
                    <tr>
                      <th>description</th>
                      <td> <?php  echo "$i->description"; ?></td>
                    </tr>


                    <tr>
                      <th>payment</th>
                      <td> <?php  echo "$i->payment"; ?></td>
                    </tr>



                    <tr>
                      <th>currency</th>
                      <td> <?php  echo "$i->currency"; ?></td>
                    </tr>

                    <tr>
                      <th>categories</th>
                      <td> <?php  echo "$i->categories"; ?></td>
                    </tr>

                    <tr>
                      <th>barsPosition</th>
                      <td> <?php  echo "$i->barsPosition"; ?></td>
                    </tr>

                    <tr>
                      <th>productView</th>
                      <td> <?php  echo "$i->productView"; ?></td>
                    </tr>

                    <tr>
                      <th>productSlider</th>
                      <td> <?php  echo "$i->productSlider"; ?></td>
                    </tr>


                    <tr>
                      <th>productSaleSlider</th>
                      <td> <?php  echo "$i->productSaleSlider"; ?></td>
                    </tr>



                    <tr>
                      <th>productIconView</th>
                      <td> <?php  echo "$i->productIconView"; ?></td>
                    </tr>

                    <tr>
                      <th>topbarColor</th>
                      <td> <?php  echo "$i->topbarColor"; ?></td>
                    </tr>


                    <tr>
                      <th>buttonsColor</th>
                      <td> <?php  echo "$i->buttonsColor"; ?></td>
                    </tr>

                    <tr>
                      <th>textColor</th>
                      <td> <?php  echo "$i->textColor"; ?></td>
                    </tr>

                    <tr>
                      <th>footerColor</th>
                      <td> <?php  echo "$i->footerColor"; ?></td>
                    </tr>
                 
                    <tr>
                    <form role="form" action="{{url('')}}/genrate" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="_token" value="<?php echo csrf_token(); ?>">
                    <label for="name">IP </label>
                                <input type="text" class="form-control" id="name" placeholder="192.168.1.1:8000" name="name">
                                <input type="hidden" class="form-control" id="id" value="<?php  echo "$i->id"; ?>" name="id">

                                <div class="card-footer">
                            <button type="submit" id="go" data-bind="click: addNew" class="btn btn-primary">Genrate</button>
                        </div>
                      
                      
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