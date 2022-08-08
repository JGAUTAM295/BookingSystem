)@extends('backend.layout.master')
@section('pagetitle', 'Booking Form Edit')

@section('head')
 <!-- daterange picker -->
 <link rel="stylesheet" href="{{ URL::asset('assests/plugins/daterangepicker/daterangepicker.css') }}">
 <!-- Ekko Lightbox -->
 <link rel="stylesheet" href="URL::asset('assests/plugins/ekko-lightbox/ekko-lightbox.css') }}">
 <style>
  .col {
    width: 50%;
    float: left;
  }
  .wrapper 
  {
      position: absolute!important;
  }
  </style>
@endsection

@section('content')
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h3>Booking Form Detail <a href="{{ route('booking-forms.list', $bookingform->form_id) }}"><button class="btn btn-primary">Back</button></a></h3>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{ url('/') }}">Home</a></li>
              <li class="breadcrumb-item active">Booking Form Edit</li>
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
          <form action="{{ route('booking-forms.update', $bookingform->id) }}" method="POST" enctype="multipart/form-data">
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">Edit Booking Form Details</h3>
            </div>
            <div class="card-body">
                @method('patch')
                @csrf
                <input type="hidden" name="id" value="{{$bookingform->id ?? ''}}">
                <input type="hidden" name="form_id" value="{{$bookingform->form_id ?? ''}}">
                <div class="row">
                  <div class="col-md-12 dynamicDiv">
                      <!-- cost_(afl_) -->
                      @if(!empty($cfs))
                        @foreach($cfs as $cf)
                        @php $colname = $cf->slug.'='.$cf->id; @endphp
                        <!-- @ if($jsonbookingform[$colname] === $colname) -->
                        <div class="form-group col">
                          <label for="inputName">{{ucwords($cf->name) ?? ''}}  @if($cf->input_required != "") <span class="text-danger">*</span> @endif</label>
                          @if($cf->input_field_type == 'Select')
                          <select id="input{{strtolower(str_replace(' ', '_', $cf->name)) ?? ''}}" class="form-control custom-select" name="{{$cf->slug.'='.$cf->id ?? ''}}" @if($cf->input_required != "") required @endif>
                            <option selected disabled>Select one</option>
                            @foreach(App\Models\CustomFields::getCustomFieldsData($cf->id) as $val)
                            <option value="{{$val->name ?? ''}}" @if($jsonbookingform[$colname] == $val->name) selected @endif>{{ucwords($val->name) ?? ''}}</option>
                            @endforeach
                          </select>

                          @elseif($cf->input_field_type == 'Artist')
                          
                          <select id="input{{strtolower(str_replace(' ', '_', $cf->name)) ?? ''}}" class="form-control custom-select" name="{{$cf->slug.'='.$cf->id ?? ''}}" @if($cf->input_required != "") required @endif>
                            <option value="">Select one</option>
                            @if(!empty($jsonbookingform[$colname]))
                            @foreach(App\Models\CustomFields::getUserByRole($cf->input_artist) as $val)
                            <option value="{{$val->id ?? ''}}" @if($jsonbookingform[$colname] == $val->id) selected @endif>{{ucwords($val->name) ?? ''}}</option>
                            @endforeach
                            @else
                            @foreach(App\Models\CustomFields::getUserByRole($cf->input_artist) as $val)
                            <option value="{{$val->id ?? ''}}">{{ucwords($val->name) ?? ''}}</option>
                            @endforeach
                            
                            @endif
                          </select>

                          @elseif($cf->input_field_type == 'Textarea')
                          
                          <textarea id="input{{strtolower(str_replace(' ', '_', $cf->name)) ?? ''}}" class="form-control" rows="3" name="{{$cf->slug.'='.$cf->id ?? ''}}" placeholder="Enter ..." @if($cf->input_required != "") required @endif>{{$jsonbookingform[$colname] ?? ''}}</textarea>
                          
                          @if(str_contains($jsonbookingform[$colname], 'iframe'))
                          {!! $jsonbookingform[$colname] ?? '' !!}
                          @endif
                     
                          @elseif($cf->input_field_type == 'Date')
                          
                          <div class="input-group date" id="reservationdatetime" data-target-input="nearest">
                            <input type="text" id="input{{strtolower(str_replace(' ', '_', $cf->name)) ?? ''}}" class="form-control datetimepicker-input" data-target="#reservationdatetime" name="{{$cf->slug.'='.$cf->id ?? ''}}" value="{{$jsonbookingform[$colname] ?? ''}}" @if($cf->input_required != "") required @endif/>
                            <div class="input-group-append" data-target="#reservationdatetime" data-toggle="datetimepicker">
                              <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                            </div>
                          </div>

                          @elseif($cf->input_field_type == 'Number')
                          
                          <input type="number" id="input{{strtolower(str_replace(' ', '_', $cf->name)) ?? ''}}" class="form-control {{strtolower($cf->input_field_type).'css'}}" name="{{$cf->slug.'='.$cf->id ?? ''}}" value="{{$jsonbookingform[$colname] ?? ''}}" @if($cf->input_required != "") required @endif>
                          
                          @elseif($cf->input_field_type == 'File')
                          
                          @if(!empty($jsonbookingform[$colname]))
                          
                          @php $filePath = urldecode(url('/public', $jsonbookingform[$colname])); @endphp
                          
                          @if(pathinfo($filePath, PATHINFO_EXTENSION) == 'pdf')
                            <br>
                            <a class="btn btn-primary btn-sm mb-2" href="{{ urldecode(url('/public', $jsonbookingform[$colname])) }}" target="_blank">
                              <i class="fas fa-file-pdf"></i> View PDF
                            </a>
                          @endif
                          
                          @if(pathinfo($filePath, PATHINFO_EXTENSION) == 'jpg' || pathinfo($filePath, PATHINFO_EXTENSION) == 'jpeg' || pathinfo($filePath, PATHINFO_EXTENSION) == 'png')
                          <br>
                            <a href="{{asset($jsonbookingform[$colname])}}" data-toggle="lightbox" data-gallery="{{$cf->name ?? '' }}">
                              <img src="{{asset($jsonbookingform[$colname])}}" class="img-fluid mb-2" alt="Equipment Image" style="width: 26%;">
                            </a>
                          @endif
                          
                          @endif
                          
                          <input type="file" id="input{{strtolower(str_replace(' ', '_', $cf->name)) ?? ''}}" class="form-control {{strtolower($cf->input_field_type).'css'}}" name="{{$cf->slug.'='.$cf->id ?? ''}}" value="{{$jsonbookingform[$colname] ?? ''}}" @if($cf->input_required != "") required @endif>
                          
                          @elseif($cf->input_field_type == 'Email')
                          
                          <input type="email" id="input{{strtolower(str_replace(' ', '_', $cf->name)) ?? ''}}" class="form-control {{strtolower($cf->input_field_type).'css'}}" name="{{$cf->slug.'='.$cf->id ?? ''}}" value="{{$jsonbookingform[$colname]?? ''}}" @if($cf->input_required != "") required @endif>
                          
                          @elseif($cf->input_field_type == 'Text')
                          
                          <input type="text" id="input{{strtolower(str_replace(' ', '_', $cf->name)) ?? ''}}" class="form-control {{strtolower($cf->input_field_type).'css'}}" name="{{$cf->slug.'='.$cf->id ?? ''}}" value="{{$jsonbookingform[$colname]?? ''}}" @if($cf->input_required != "") required @endif>
                          
                          @else
                          
                          <input type="text" id="input{{strtolower(str_replace(' ', '_', $cf->name)) ?? ''}}" class="form-control" name="{{$cf->slug.'='.$cf->id ?? ''}}" value="{{$jsonbookingform[$colname] ?? ''}}" @if($cf->input_required != "") required @endif>
                          
                          @endif
                        </div>
                        <!-- @ endif -->
                        @endforeach
                      @endif
                  </div>
                </div>
              
            <!-- /.card-body -->
            </div>
          <!-- /.card -->
          </div>
          <div class="row">
            <div class="col-12">
                <a href="{{ route('booking-forms.index') }}" class="btn btn-secondary">Cancel</a>
                <input type="submit" value="Update booking" class="btn btn-success float-right">
            </div>
          </div>
          </form>
        </div>
      </div>
    </section>
    <!-- /.content -->
 
@endsection

@section('footerscript')
<!-- date-range-picker -->
<script src="{{ URL::asset('assests/plugins/daterangepicker/daterangepicker.js') }}"></script>
<!-- Ekko Lightbox -->
<script src="{{ URL::asset('assests/plugins/ekko-lightbox/ekko-lightbox.min.js') }}"></script>

<script type="text/javascript">
    $(document).ready(function() {
        //Date picker
        $('#reservationdatetime').datetimepicker({ icons: { time: 'far fa-clock' } });
    });
    
    $(function () {
    $(document).on('click', '[data-toggle="lightbox"]', function(event) {
      event.preventDefault();
      $(this).ekkoLightbox({
        alwaysShowClose: true
      });
    });
  })
</script>
@endsection