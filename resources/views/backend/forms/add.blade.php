@extends('backend.layout.master')
@section('pagetitle', 'Form Add')

@section('head')
  <!-- daterange picker -->
  <link rel="stylesheet" href="{{ URL::asset('assests/plugins/daterangepicker/daterangepicker.css') }}">
  <style>
  .col {
    width: 50%;
    float: left;
  }
  </style>
@endsection

@section('content')

    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h3>Add Form <a href="{{ route('forms.index') }}"><button class="btn btn-primary">Back</button></a></h3>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{ url('/') }}">Home</a></li>
              <li class="breadcrumb-item active">Form Add</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-12">
        @if (count($errors) > 0)
            <div class="alert alert-danger">
                <strong>Whoops!</strong> There were some problems with your input.<br><br>
                <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
                </ul>
            </div>
        @endif
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">Add Form Details</h3>
            </div>
            <div class="card-body">
                <form action="{{ route('forms.store') }}" method="POST" enctype="multipart/form-data">
                  @csrf
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group {{ $errors->has('title') ? 'has-error' : ''}}">
                          <label for="inputTitle">Form Title <span class="text-danger">*</span></label>
                          <input type="text" id="inputTitle" class="form-control" name="title" required>
                          @error('title')
                          <span class="invalid-feedback" role="alert" style="display:block;">
                            <strong>{{ $message }}</strong>
                          </span>
                          @enderror
                        </div>
                      </div>
                      <div class="form-group {{ $errors->has('status') ? 'has-error' : ''}}">
                        <label for="inputStatus">Status <span class="text-danger">*</span></label>
                        <select id="inputStatus" class="form-control custom-select" name="status">
                          <option selected disabled>Select one</option>
                          <option value="1">Active</option>
                          <option value="2">Deactive</option>
                        </select>
                        @error('status')
                          <span class="invalid-feedback" role="alert" style="display:block;">
                            <strong>{{ $message }}</strong>
                          </span>
                        @enderror
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-12 mb-5 mx-3">
                      <div class="form-group">
                        <a href="{{ route('forms.index') }}" class="btn btn-secondary">Cancel</a>
                        <input type="submit" value="Create new form" class="btn btn-success float-right">
                      </div>
                    </div>
                  </div>
                </form>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
      </div>
    </section>
    <!-- /.content -->
 
@endsection

@section('footerscript')
<!-- date-range-picker -->
<script src="{{ URL::asset('assests/plugins/daterangepicker/daterangepicker.js') }}"></script>

<script type="text/javascript">
    $(document).ready(function() {
          //Date picker
    $('#reservationdate').datetimepicker({
        format: 'L'
    });
    });
</script>
@endsection