@extends('head')

<!DOCTYPE html>
<html>

<!-- <link rel="stylesheet" src="import.css"> -->


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
                            <li class="breadcrumb-item active">Add products</li>
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
                    <form role="form" action="{{url('')}}/add_sale" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="_token" value="<?php echo csrf_token(); ?>">
                        <h1>Products</h1>
                        <div class="card-body">
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" class="form-control" id="name" placeholder="Enter product Name" name="name">
                            </div>
                            <div class="form-group">
                                <label for="price">Price old</label>
                                <input type="text" class="form-control" id="price" placeholder="Enter Price" name="price_old">
                            </div>
                            <div class="form-group">
                                <label for="price">Price new</label>
                                <input type="text" class="form-control" id="price" placeholder="Enter Price" name="price_new">
                            </div>
                         
                            <div class="form-group">
                                <label for="exampleInputFile">File input</lab   el>
                                <div class="input-group">
                                    <div class="custom-file">
                                    <input type="file" multiple="true" name="image"  />
                                    <!-- <button id="go" data-bind="click: addNew">Create</button> -->
                                    <div id="images"></div>
                                    </div>
                                    <!-- <div class="input-group-append">
                                        <span class="input-group-text" id="">Upload</span>
                                    </div> -->
                                    <div class="input-group-append">
                                        <!-- <input type="file" multiple="true" id="files" value="+" /> -->
                                        <!-- <span class="input-group-text" id="files">+</span> -->
                                    </div>
                                </div>
                            </div>
                        
                        </div>
                        <!-- /.card-body -->

                        <div class="card-footer">
                            <button type="submit" id="go" data-bind="click: addNew" class="btn btn-primary">Submit</button>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/knockout/2.3.0/knockout-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/knockout/2.3.0/knockout-min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>

<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script src="http://circletype.labwire.ca/js/circletype.js"></script>
<script src="http://tympanus.net/Development/Arctext/js/jquery.arctext.js"></script>
</html>
