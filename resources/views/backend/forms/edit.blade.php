)@extends('backend.layout.master')
@section('pagetitle', 'Form Edit')

@section('head')
@endsection

@section('content')
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h3>Form Detail <a href="{{ route('forms.index') }}"><button class="btn btn-primary">Back</button></a></h3>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{ url('/') }}">Home</a></li>
              <li class="breadcrumb-item active">Form Edit</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

     <!-- Main content -->
     <section class="content">
      <div class="row">
        <div class="col-md-12">
          <form action="{{ route('forms.update', $form->id ) }}" method="POST" enctype="multipart/form-data">
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">Edit Form Details</h3>
            </div>
            <div class="card-body">
                @method('patch')
                @csrf
                <div class="row">
                  <div class="col-md-12 dynamicDiv">
                      <div class="form-group {{ $errors->has('title') ? 'has-error' : ''}}">
                        <label for="inputTitle">Title <span class="text-danger">*</span></label>
                        <input type="text" id="inputTitle" class="form-control" name="title" value="{{$form->title ?? ''}}" required>
                        @error('title')
                          <span class="invalid-feedback" role="alert" style="display:block;">
                            <strong>{{ $message }}</strong>
                          </span>
                        @enderror
                      </div>

                      <div class="form-group {{ $errors->has('showemail') ? 'has-error' : ''}}">
                      <label for="inputSenderEmail">Sender Email <span class="text-danger">*</span></label>
                        <div class="custom-radio">
                          <input type="radio" id="showemailinputYes" class="showemailinput" name="showemail" value="Yes" @if($form->showemail == 'Yes') checked @endif>
                          <label for="showreportYes">Yes</label>
                          <input type="radio" id="showemailinputNo" class="showemailinput" name="showemail" value="No"  @if($form->showemail == 'No') checked @endif>
                          <label for="showreportNo">No</label><br>
                        </div>
                        <div id="showemaildivYes" class="{{ $errors->has('sender_email') ? 'has-error' : ''}}" @if($form->showemail == 'Yes') style="display:block;" @else style="display:none;" @endif>
                        <input type="text" id="inputSenderEmail" class="form-control" name="sender_email" placeholder="Enter sender emails" value="{{$form->sender_email ?? ''}}">
                        @error('showemail')
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
                          <option value="1" @if($form->status == '1') selected @endif>Active</option>
                          <option value="2" @if($form->status == '2') selected @endif>Deactive</option>
                        </select>
                        @error('status')
                          <span class="invalid-feedback" role="alert" style="display:block;">
                            <strong>{{ $message }}</strong>
                          </span>
                        @enderror
                      </div>
                  </div>
                </div>
              
            <!-- /.card-body -->
            </div>
          <!-- /.card -->
          </div>
          <div class="row">
            <div class="col-12">
                <a href="{{ route('forms.index') }}" class="btn btn-secondary">Cancel</a>
                <input type="submit" value="Update form" class="btn btn-success float-right">
            </div>
          </div>
          </form>
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