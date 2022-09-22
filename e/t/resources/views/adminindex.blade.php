


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
                            <li class="breadcrumb-item active">Dashboard</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-sm-9 text-center">
                    <a href="{{ URL::to('/') }}/products">
                        <button>Add Products</button>
                    </a>
                    <hr>
                </div>
                <div class="col-sm-9 text-center">
                    <a href="{{ URL::to('/') }}/categories">
                        <button>Add Categories</button>
                    </a>
                    <hr>
                </div>
                <div class="col-sm-9 text-center">
                    <a href="{{ URL::to('/') }}/sale">
                        <button>Add Sale</button>
                    </a>
                    <hr>
                </div>
                <hr>
                <hr>
            </div>
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    @extends('footer')

</body>
</html>
