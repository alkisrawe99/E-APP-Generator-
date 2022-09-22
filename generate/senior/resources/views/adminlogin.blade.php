@extends('head')
<div class="row">
    <div class="col-sm-3">

    </div>
    <div class="col-sm-6">
        <div class="card card-info">
            <div class="card-header">
                <h3 class="card-title">Admin Login</h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <form class="form-horizontal" action="{{url('')}}/admin_login" method="POST">
            <input type="hidden" name="_token" value="<?php echo csrf_token(); ?>">
                <div class="card-body">
                    <div class="form-group row">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputEmail3" placeholder="Email" name="email">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="inputPassword3" placeholder="Password" name="password">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="offset-sm-2 col-sm-10">

                        </div>
                    </div>
                </div>
                <!-- /.card-body -->
                <div class="card-footer text-center">
                    <button type="submit" class="btn btn-info" name="login">Sign in</button>
                </div>
                <!-- /.card-footer -->
            </form>
        </div>
    </div>
    <div class="col-sm-3">

    </div>
</div>