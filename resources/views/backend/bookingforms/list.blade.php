@extends('backend.layout.master')
@section('pagetitle', 'Booking Forms List')

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
            <h3>Booking Forms</h3>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{ url('/') }}">Home</a></li>
              <li class="breadcrumb-item active">Booking Forms</li>
            </ol>
          </div>

          <div id="importdiv" class="col-xl-12 col-md-12 col-12 mt-4" style="display:none;">
            @if(Session::has("success"))
            <div class="alert alert-success alert-primary alert-dismissible fade show " role="alert">
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">×</span>
                  <span class="sr-only">Close</span>
              </button>
              <strong>Success!</strong> {{Session::get("success")}}
            </div>
            @elseif(Session::has("failed"))
            <div class="alert alert-danger alert-dismissible fade show " role="alert">
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">×</span>
                  <span class="sr-only">Close</span>
              </button>
              {{Session::get("failed")}}
            </div>
            @endif
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
                    <th>No</th>
                    <th>Title</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                  </thead>
                  <tbody>
                    @if($forms)
                    @foreach($forms as $key => $form)
                  <tr>
                    <td>{{ $key+1 }}</td>
                    <td>{{ucwords($form->title) ?? ''}}</td>
                    <td class="project-state"> @if($form->status == '1') <span class="badge badge-success">Active</span>@elseif($form->status == '2') <span class="badge badge-danger">Deactive</span>@endif</td>
                    <td class="project-actions">
                      @if(in_array('booking-forms.show', $groupsWithRoles))
                      <a class="btn btn-primary btn-sm" href="{{ route('booking-forms.show', $form->id) }}">
                        <i class="fas fa-eye"></i> View
                      </a>
                      @endif
                      <a class="btn btn-info btn-sm text-white" href="{{ route('booking-forms.list', $form->id) }}">
                          <i class="fas fa-eye"></i> Entries
                      </a>
                    </td>
                  </tr>
                  @endforeach
                  @else
                  <tr>
                    <td colspan="6">No Data Found!</td>
                  </tr>
                  @endif
                  </tfoot>
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

  $('.show_confirm').click(function(event) {
      var form =  $(this).closest("form");
      var name = $(this).data("name");
      event.preventDefault();
      swal({
          title: `Are you sure you want to delete this `+name+` booking form?` ,
          text: "If you delete this, it will be gone forever.",
          icon: "warning",
          buttons: true,
          dangerMode: true,
          buttons: ['No, cancel it!', 'Yes, I am sure!'],
      })
      .then((willDelete) => {
        if (willDelete) {
          form.submit();
        }
      });
  });

  $(function () {
    $("#example1").DataTable({
      "responsive": true, "lengthChange": false, "autoWidth": false,
      // "buttons": ["copy", "csv", "excel", "pdf", "print"]
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