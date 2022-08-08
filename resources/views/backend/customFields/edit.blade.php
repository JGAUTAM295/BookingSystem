@extends('backend.layout.master')
@section('pagetitle', 'Custom Field Edit')

@section('head')
<!-- Select2 -->
<link rel="stylesheet" href="{{ URL::asset('assests/plugins/select2/css/select2.min.css') }}">
<link rel="stylesheet" href="{{ URL::asset('assests/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
<style>
  .select2-container--default .select2-selection--multiple {
    background-color: transparent!important;
    border: 1px solid #6c757d!important;
    color: #fff!important;
  }
  .select2-container--default .select2-selection--multiple .select2-selection__choice {
    background-color: #3f6791!important;
    border-color: #3f6791!important;
}
.select2-container--default .select2-selection--multiple .select2-selection__choice__remove {
    color: #fff!important;
}
input.select2-search__field::placeholder {
    color: #fff!important;
}
</style>
@endsection

@section('content')
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h3>Custom Field Detail <a href="{{ route('custom-fields.index') }}"><button class="btn btn-primary">Back</button></a></h3>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{ url('/') }}">Home</a></li>
              <li class="breadcrumb-item active">Custom Field Edit</li>
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
              <h3 class="card-title">Edit {{ ucwords($customFields->title) ?? ''}} Custom Field Details</h3>
            </div>
            <div class="card-body">
              <form action="{{ route('custom-fields.update', $customFields->id) }}" method="POST" enctype="multipart/form-data">
                @method('patch')
                @csrf
                <input type="hidden" name="id" value="{{ $customFields->id ?? '' }}">
                <div class="row">
                  <div class="col-md-6">
                    <div class="form-group {{ $errors->has('name') ? 'has-error' : ''}}">
                        <label for="inputName">Name <span class="text-danger">*</span></label>
                        <input type="text" id="inputName" class="form-control" name="name" value="{{ $customFields->name ?? ''}}" required>
                        @error('name')
                          <span class="invalid-feedback" role="alert" style="display:block;">
                            <strong>{{ $message }}</strong>
                          </span>
                        @enderror
                    </div>
                    <div class="form-group {{ $errors->has('input_field_type') ? 'has-error' : ''}}">
                        <label for="input_type">Input Field Type <span class="text-danger">*</span></label>
                        <select id="input_type" class="form-control custom-select" name="input_field_type">
                          <option selected disabled>Select one</option>
                          <option value="Text" @if($customFields->input_field_type == 'Text') selected @endif>Text</option>
                          <option value="Textarea" @if($customFields->input_field_type == 'Textarea') selected @endif>Textarea</option>
                          <option value="Date" @if($customFields->input_field_type == 'Date') selected @endif>Date</option>
                          <option value="Number" @if($customFields->input_field_type == 'Number') selected @endif>Number</option>
                          <option value="Select" @if($customFields->input_field_type == 'Select') selected @endif>Select</option>
                          <option value="File" @if($customFields->input_field_type == 'File') selected @endif>File</option>
                        </select>
                        @error('input_field_type')
                          <span class="invalid-feedback" role="alert" style="display:block;">
                            <strong>{{ $message }}</strong>
                          </span>
                        @enderror
                        @php $selected = explode(",", $customFields->file_accept) @endphp
                        <div id="FileValid" class="mt-2" @if($customFields->input_field_type == 'File') style="display:block" @else style="display:none" @endif>
                            <label for="file_accept">File Accept Validation<span class="text-danger">*</span></label>
                            <select id="file_accept" class="form-control select2" name="file_accept[]" multiple="multiple" data-placeholder="Select one" style="width: 100%;">
                                <option value="png" {{ (in_array('png', $selected)) ? 'selected' : '' }}>PNG</option>
                                <option value="jpg" {{ (in_array('jpg', $selected)) ? 'selected' : '' }}>JPG</option>
                                <option value="jpeg" {{ (in_array('jpeg', $selected)) ? 'selected' : '' }}>JPEG</option>
                                <option value="pdf" {{ (in_array('pdf', $selected)) ? 'selected' : '' }}>PDF</option>
                            </select>
                        </div>
                        
                    </div>
                    <div id="input_req" class="form-group {{ $errors->has('input_required') ? 'has-error' : ''}}">
                      <input type="hidden" name="input_required" value="0">
                      <label for="inputName" data-labelfor="input_required" class="my-4"><input type="checkbox" name="input_required" value="{{ $customFields->input_required ?? '1'}}" class="mx-2" {{ $customFields->input_required ? 'checked' : '' }} > Input Field Required</label>
                      @error('input_required')
                        <span class="invalid-feedback" role="alert" style="display:block;">
                          <strong>{{ $message }}</strong>
                        </span>
                      @enderror
                    </div>
                  </div>
                  <div class="col-md-6">
                  <div class="form-group {{ $errors->has('order_no') ? 'has-error' : ''}}">
                        <label for="inputOrder">Input Field Order <span class="text-danger">*</span></label>
                        <input type="number" id="inputOrder" class="form-control" name="order_no" value="{{ $customFields->order_no ?? ''}}" required>
                        @error('order_no')
                          <span class="invalid-feedback" role="alert" style="display:block;">
                            <strong>{{ $message }}</strong>
                          </span>
                        @enderror
                    </div>
                    <div class="form-group {{ $errors->has('status') ? 'has-error' : ''}}">
                      <label for="inputStatus">Status  <span class="text-danger">*</span></label>
                      <select id="inputStatus" class="form-control custom-select" name="status">
                        <option selected disabled>Select one</option>
                        <option value="1" @if($customFields->status == '1') selected @endif>Active</option>
                        <option value="2" @if($customFields->status == '2') selected @endif>Deactive</option>
                      </select>
                      @error('status')
                        <span class="invalid-feedback" role="alert" style="display:block;">
                          <strong>{{ $message }}</strong>
                        </span>
                      @enderror
                    </div>
                    </div>
                  </div>
                  <div class="col-12">
                    <a href="{{ route('custom-fields.index') }}" class="btn btn-secondary">Cancel</a>
                    <input type="submit" value="Update Custom Field" class="btn btn-success float-right">
                  </div>
                </div>
              </form>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
      </div>
    </section>
    <!-- /.content -->
 
@endsection

@section('footerscript')
<!-- Select2 -->
<script src="{{ URL::asset('assests/plugins/select2/js/select2.full.min.js') }}"></script>

<script>
   $(document).ready(function() 
   {
    //Initialize Select2 Elements
    $('.select2').select2();
    
    $('#input_type').change(function(){
        if($(this).val() == 'File')
        {
            $('#' + $(this).val()+'Valid').show();
        }
        else
        {
            $('#FileValid').hide();
        }
    });
    
    $('#input_req label').bind('click',function(){
      var input = $(this).find('input');  
      if(input.prop('checked'))
      {
        input.prop('checked', false);
      }
      else
      {
        input.prop('checked', true);
      }
    });
  });
</script>
@endsection