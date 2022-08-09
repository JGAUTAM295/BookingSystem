@extends('backend.layout.master')
@section('pagetitle', 'Reports')

@section('head')
 <!-- DataTables -->
  <link rel="stylesheet" href="{{ URL::asset('assests/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css') }}">
  <link rel="stylesheet" href="{{ URL::asset('assests/plugins/datatables-responsive/css/responsive.bootstrap4.min.css') }}">
  <link rel="stylesheet" href="{{ URL::asset('assests/plugins/datatables-buttons/css/buttons.bootstrap4.min.css') }}">
  <style>
    .form-group input[type="file"] {
      float: none!important;
      width: 20%;
    }
  </style>
@endsection

@section('content')
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h3>{{$form->title ?? ''}} Report
              @if(in_array('booking-forms.export', $groupsWithRoles)) <a href="{{ route('booking-forms.export', $form->id) }}"><button class="btn btn-primary">Export</button></a> @endif
              <a href="{{ route('dashboard') }}"><button class="btn btn-primary">Back</button></a>
            </h3>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{ url('/') }}">Home</a></li>
              <li class="breadcrumb-item active">Reports</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
          @include('backend.layout.messages')
            <div class="card">
                <!-- /.card-header -->
                <div class="card-body">
                    <table id="example1" class="table table-bordered table-striped mt-3">
                        <thead>
                            <tr>
                                <th>Booking ID</th>
                                @foreach($cfs as $cf)
                                <th>{{$cf->name}}</th>
                                @endforeach
                            </tr>
                        </thead>
                        <tbody>
                            @php
                            $val = array();
                            $count = 0;
                            @endphp
                            @foreach($my_var as $val)
                            <tr>
                                @foreach(array_slice($val, 0, 6) as $value)
                                <td>{{$value}}</td>
                                @endforeach
                            @php $count++; @endphp
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
 
@endsection

@section('footerscript')


<!-- DataTables  & Plugins -->
<script src="{{ URL::asset('assests/plugins/datatables/jquery.dataTables.min.js') }}"></script>
<script src="{{ URL::asset('assests/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js') }}"></script>
<script src="{{ URL::asset('assests/plugins/datatables-responsive/js/dataTables.responsive.min.js') }}"></script>
<script src="{{ URL::asset('assests/plugins/datatables-responsive/js/responsive.bootstrap4.min.js') }}"></script>
<script src="{{ URL::asset('assests/plugins/datatables-buttons/js/dataTables.buttons.min.js') }}"></script>
<script src="{{ URL::asset('assests/plugins/datatables-buttons/js/buttons.bootstrap4.min.js') }}"></script>
<script src="{{ URL::asset('assests/plugins/jszip/jszip.min.js') }}"></script>
<script src="{{ URL::asset('assests/plugins/pdfmake/pdfmake.min.js') }}"></script>
<script src="{{ URL::asset('assests/plugins/pdfmake/vfs_fonts.js') }}"></script>
<script src="{{ URL::asset('assests/plugins/datatables-buttons/js/buttons.html5.min.js') }}"></script>
<script src="{{ URL::asset('assests/plugins/datatables-buttons/js/buttons.print.min.js') }}"></script>
<script src="{{ URL::asset('assests/plugins/datatables-buttons/js/buttons.colVis.min.js') }}"></script>
<!-- Page specific script -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>

<script type="text/javascript">

  $(function () {
    $("#example1").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": [
        {
         extend: 'copy',
         text: 'Copy',
         exportOptions: {
            columns: 'th:not(:last-child)'
        }
      },
      {
         extend: 'csv',
         text: 'CSV',
         exportOptions: {
            columns: 'th:not(:last-child)'
         }
      },
      {
         extend: 'excel',
         text: 'Excel',
         exportOptions: {
            columns: 'th:not(:last-child)'
         }
      }, 
      {
         extend: 'pdf',
         text: 'PDF',
         exportOptions: {
            columns: 'th:not(:last-child)'
         }
      },
      {
         extend: 'print',
         text: 'Print',
         exportOptions: {
            columns: 'th:not(:last-child)'
         }
      }, 
    ]
    }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
      "responsive": true,
    });

    $('#import_box').click(function() {
        $('#importdiv').toggle();
        return false;
    });        
   });
</script>

@endsection