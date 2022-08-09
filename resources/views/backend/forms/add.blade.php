@extends('backend.layout.master')
@section('pagetitle', 'Form Add')

@section('head')
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
                      <div class="form-group {{ $errors->has('sender_email') ? 'has-error' : ''}}">
                      <label for="inputSenderEmail">Sender Email <span class="text-danger">*</span></label>
                        <div class="custom-radio">
                          <input type="radio" id="showemailinputYes" class="showemailinput" name="showemail" value="Yes">
                          <label for="showreportYes">Yes</label>
                          <input type="radio" id="showemailinputNo" class="showemailinput" name="showemail" value="No">
                          <label for="showreportNo">No</label><br>
                        </div>
                        <div id="showemaildivYes" class="{{ $errors->has('sender_email') ? 'has-error' : ''}}" style="display:none;">
                        <input type="text" id="inputSenderEmail" class="form-control" name="sender_email" placeholder="Enter sender emails">
                        @error('sender_email')
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
                    <div class="col-12 mb-2">
                      <div class="form-group">
                        <a href="{{ route('forms.index') }}" class="btn btn-secondary mx-3">Cancel</a>
                        <input type="submit" value="Create new form" class="btn btn-success float-right mx-3">
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
<script type="text/javascript">
  $(document).ready(function () {
    $(".showemailinput").click(function(){
      if($(this).val() == 'Yes')
      {
        $('#showemaildiv'+$(this).val()).show();
      }
      else
      {
        $('#showemaildivYes').hide();
      }
    });
  });
</script>
@endsection