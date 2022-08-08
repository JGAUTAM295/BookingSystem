@extends('backend.layout.master')
@section('head')
  <link rel="stylesheet" href="{{ URL::asset('assests/plugins/toastr/toastr.min.css') }}">
  <link rel="stylesheet" href="{{ URL::asset('assests/dist/css/dashlite.css') }}">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.min.js"></script>
@endsection
@section('content')
 <!-- Content Header (Page header) -->
 <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Dashboard</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{url('/')}}">Home</a></li>
              <li class="breadcrumb-item active">Dashboard</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <!-- row -->
     <div class="row g-gs">
      <div class="col-md-4">
        <div class="card card-bordered card-full">
          <div class="card-inner">
            <div class="card-title-group align-start mb-0">
              <div class="card-title">
                <h6 class="title">Total Booking</h6>
              </div>
              <div class="card-tools">
                <em class="card-hint icon ni ni-help-fill" data-bs-toggle="tooltip" data-bs-placement="left" title="" data-bs-original-title="Total Booking" aria-label="Total Booking"></em>
              </div>
            </div>
            <div class="card-amount">
              <span class="amount"> {{ $count_BookingForms ?? '0'}}</span>
            </div>
            <div class="invest-data">
              <div class="invest-data-amount g-2">
                <div class="invest-data-history">
                  <div class="title">This Month</div>
                  <div class="amount">{{$currentmonthbooking ?? '0'}}</div>
                </div>
                <div class="invest-data-history">
                  <div class="title">This Week</div>
                  <div class="amount">{{$currentweekbooking ?? '0'}}</div>
                </div>
              </div>
              <div class="invest-data-ck">
                <div class="chartjs-size-monitor">
                  <div class="chartjs-size-monitor-expand">
                    <div class=""></div>
                  </div>
                  <div class="chartjs-size-monitor-shrink">
                    <div class=""></div>
                  </div>
                </div>
                <canvas class="iv-data-chart chartjs-render-monitor" id="totalBooking" width="165" height="48" style="display: block; width: 165px; height: 48px;"></canvas>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card card-bordered card-full">
          <div class="card-inner">
            <div class="card-title-group align-start mb-0">
              <div class="card-title">
                <h6 class="title">Artist Available</h6>
              </div>
              <div class="card-tools">
                <em class="card-hint icon ni ni-help-fill" data-bs-toggle="tooltip" data-bs-placement="left" title="" data-bs-original-title="Total Room" aria-label="Total Room"></em>
              </div>
            </div>
            <div class="card-amount">
              <span class="amount"> {{$count_BookedArtist ?? '0'}} </span>
            </div>
            <div class="invest-data">
              <div class="invest-data-amount g-2">
                <div class="invest-data-history">
                  <div class="title">Booked (Month)</div>
                  <div class="amount">{{count($count_BookedArtistM) ?? '0'}}</div>
                </div>
                <div class="invest-data-history">
                  <div class="title">Booked (Week)</div>
                  <div class="amount">{{count($count_BookedArtistW) ?? '0'}}</div>
                </div>
              </div>
              <div class="invest-data-ck">
                <div class="chartjs-size-monitor">
                  <div class="chartjs-size-monitor-expand">
                    <div class=""></div>
                  </div>
                  <div class="chartjs-size-monitor-shrink">
                    <div class=""></div>
                  </div>
                </div>
                <canvas class="iv-data-chart chartjs-render-monitor" id="totalRoom" width="135" height="48" style="display: block; width: 135px; height: 48px;"></canvas>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card card-bordered  card-full">
          <div class="card-inner">
            <div class="card-title-group align-start mb-0">
              <div class="card-title">
                <h6 class="title">Expenses</h6>
              </div>
              <div class="card-tools">
                <em class="card-hint icon ni ni-help-fill" data-bs-toggle="tooltip" data-bs-placement="left" title="" data-bs-original-title="Total Expenses" aria-label="Total Expenses"></em>
              </div>
            </div>
            <div class="card-amount">
              <span class="amount"> 79,358.50 <span class="currency currency-usd">USD</span></span>
            </div>
            <div class="invest-data">
              <div class="invest-data-amount g-2">
                <div class="invest-data-history">
                  <div class="title">This Month</div>
                  <div class="amount">3,540.59 <span class="currency currency-usd">USD</span></div>
                </div>
                <div class="invest-data-history">
                  <div class="title">This Week</div>
                  <div class="amount">1,259.28 <span class="currency currency-usd">USD</span></div>
                </div>
              </div>
              <div class="invest-data-ck">
                <div class="chartjs-size-monitor">
                  <div class="chartjs-size-monitor-expand">
                    <div class=""></div>
                  </div>
                  <div class="chartjs-size-monitor-shrink">
                    <div class=""></div>
                  </div>
                </div>
                <canvas class="iv-data-chart chartjs-render-monitor" id="totalExpenses" width="147" height="48" style="display: block; width: 147px; height: 48px;"></canvas>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-xxl-4">
        <div class="card card-bordered card-full">
          <div class="card-inner d-flex flex-column h-100">
            <div class="card-title-group mb-3">
              <div class="card-title me-1">
                <h6 class="title">Top Selected Package</h6><br>
                <p>In last 30 days top selected package.</p>
              </div>
              <div class="card-tools mt-n1 me-n1">
                <div class="drodown">
                  <a href="#" class="dropdown-toggle dropdown-indicator btn btn-sm btn-outline-light btn-white" data-bs-toggle="dropdown">30 Days</a>
                  <div class="dropdown-menu dropdown-menu-end dropdown-menu-xs">
                    <ul class="link-list-opt no-bdr">
                      <li><a href="#"><span>7 Days</span></a></li>
                      <li><a href="#"><span>15 Days</span></a></li>
                      <li><a href="#"><span>30 Days</span></a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
            <div class="progress-list gy-3">
              <div class="progress-wrap">
                <div class="progress-text">
                  <div class="progress-label">Strater Package</div>
                  <div class="progress-amount">58%</div>
                </div>
                <div class="progress progress-md">
                  <div class="progress-bar" data-progress="58" style="width: 58%;"></div>
                </div>
              </div>
              <div class="progress-wrap">
                <div class="progress-text">
                  <div class="progress-label">Honeymoon Package</div>
                  <div class="progress-amount">43%</div>
                </div>
                <div class="progress progress-md">
                  <div class="progress-bar bg-warning" data-progress="43" style="width: 43%;"></div>
                </div>
              </div>
              <div class="progress-wrap">
                <div class="progress-text">
                  <div class="progress-label">Vacation Package</div>
                  <div class="progress-amount">33%</div>
                </div>
                <div class="progress progress-md">
                  <div class="progress-bar bg-azure" data-progress="33" style="width: 33%;"></div>
                </div>
              </div>
              <div class="progress-wrap">
                <div class="progress-text">
                  <div class="progress-label">Continental Package</div>
                  <div class="progress-amount">29%</div>
                </div>
                <div class="progress progress-md">
                  <div class="progress-bar bg-pink" data-progress="29" style="width: 29%;"></div>
                </div>
              </div>
              <div class="progress-wrap">
                <div class="progress-text">
                  <div class="progress-label">Spring Package</div>
                  <div class="progress-amount">18.49%</div>
                </div>
                <div class="progress progress-md">
                  <div class="progress-bar bg-orange" data-progress="18.49" style="width: 18.49%;"></div>
                </div>
              </div>
              <div class="progress-wrap">
                <div class="progress-text">
                  <div class="progress-label">All suite Package</div>
                  <div class="progress-amount">16%</div>
                </div><div class="progress progress-md">
                  <div class="progress-bar bg-teal" data-progress="16" style="width: 16%;"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-6 col-xxl-5">
        <div class="card card-bordered h-96">
          <div class="card-inner">
            <div class="card-title-group align-start pb-3 g-2">
              <div class="card-title">
                <h6 class="title">Sales Revenue</h6><br>
                <p>In last 30 days revenue from rent.</p>
              </div>
              <div class="card-tools">
                <em class="card-hint icon ni ni-help" data-bs-toggle="tooltip" data-bs-placement="left" title="" data-bs-original-title="Revenue of this month" aria-label="Revenue of this month"></em>
              </div>
            </div>
            <div class="analytic-au">
              <div class="analytic-data-group analytic-au-group g-3">
                <div class="analytic-data analytic-au-data">
                  <div class="title">Monthly</div>
                  <div class="amount">9.28K</div>
                  <div class="change up">
                    <em class="icon ni ni-arrow-long-up"></em>4.63%
                  </div>
                </div>
                <div class="analytic-data analytic-au-data">
                  <div class="title">Weekly</div>
                  <div class="amount">2.69K</div>
                  <div class="change down">
                    <em class="icon ni ni-arrow-long-down"></em>1.92%
                  </div>
                </div>
                <div class="analytic-data analytic-au-data">
                  <div class="title">Daily (Avg)</div>
                  <div class="amount">0.94K</div>
                  <div class="change up">
                    <em class="icon ni ni-arrow-long-up"></em>3.45%
                  </div>
                </div>
              </div>
              <div class="analytic-au-ck">
                <div class="chartjs-size-monitor">
                  <div class="chartjs-size-monitor-expand">
                    <div class=""></div>
                  </div>
                  <div class="chartjs-size-monitor-shrink">
                    <div class=""></div>
                  </div>
                </div>
                <canvas class="analytics-au-chart chartjs-render-monitor" id="analyticAuData" style="display: block; width: 576px; height: 170px;" width="576" height="170"></canvas>
              </div>
              <div class="chart-label-group">
                <div class="chart-label">01 Jan, 2020</div>
                <div class="chart-label">30 Jan, 2020</div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-6 col-xxl-3">
        <div class="card card-bordered h-96">
          <div class="card-inner">
            <div class="card-title-group">
              <div class="card-title">
                <h6 class="title">Artist Booking Chart</h6>
              </div>
              <div class="card-tools">
                <div class="drodown">
                  <a href="#" class="dropdown-toggle dropdown-indicator btn btn-sm btn-outline-light btn-white" data-bs-toggle="dropdown">30 Days</a>
                  <div class="dropdown-menu dropdown-menu-end dropdown-menu-xs">
                    <ul class="link-list-opt no-bdr">
                      <li><a href="#"><span>7 Days</span></a></li>
                      <li><a href="#"><span>15 Days</span></a></li>
                      <li><a href="#"><span>30 Days</span></a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
            <div class="traffic-channel">
              <div class="traffic-channel-doughnut-ck">
                <div class="chartjs-size-monitor">
                  <div class="chartjs-size-monitor-expand">
                    <div class=""></div>
                  </div>
                  <div class="chartjs-size-monitor-shrink">
                    <div class=""></div>
                  </div>
                </div>
                <canvas class="analytics-doughnut chartjs-render-monitor" id="doughnut_chart" width="314" height="160" style="display: block; width: 314px; height: 160px;"></canvas>
              </div>
              <div class="traffic-channel-group g-2">
                @if(count($getroles) != '0')
                @foreach($getroles as $getrole)
                <div class="traffic-channel-data">
                  <div class="title">
                    <span class="dot dot-lg sq" data-bg="#9cabff" style="background-color: {{$getrole->bgcolor  ?? '#000'}};"></span>
                    <span>{{$getrole->name ?? ''}}</span></div><div class="amount">{{ App\Models\BookedArtist::getartistbookcountbyrole($getrole->name) ?? '0'}}</div>
                </div>
                @endforeach
                @endif
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- <div class="col-xxl-5">
        <div class="card card-bordered h-100">
          <div class="card-inner">
            <div class="card-title-group pb-3 g-2">
              <div class="card-title">
                <h6 class="title">Income vs Expenses</h6>
                <p>How was your income and Expenses this month.</p>
              </div>
              <div class="card-tools shrink-0 d-none d-sm-block">
                <ul class="nav nav-switch-s2 nav-tabs bg-white">
                  <li class="nav-item">
                    <a href="#" class="nav-link">7 D</a>
                  </li>
                  <li class="nav-item"><a href="#" class="nav-link active">1 M</a></li>
                  <li class="nav-item"><a href="#" class="nav-link">3 M</a></li>
                </ul>
              </div>
            </div>
            <div class="analytic-ov">
              <div class="analytic-data-group analytic-ov-group g-3">
                <div class="analytic-data analytic-ov-data">
                  <div class="title text-primary">Income</div>
                  <div class="amount">2.57K</div>
                  <div class="change down"><em class="icon ni ni-arrow-long-down"></em>12.37%</div>
                </div>
                <div class="analytic-data analytic-ov-data">
                  <div class="title text-danger">Expenses</div>
                  <div class="amount">3.5K</div>
                  <div class="change down"><em class="icon ni ni-arrow-long-up"></em>8.37%</div>
                </div>
              </div>
              <div class="analytic-ov-ck">
                <div class="chartjs-size-monitor">
                  <div class="chartjs-size-monitor-expand">
                    <div class=""></div>
                  </div>
                  <div class="chartjs-size-monitor-shrink">
                    <div class=""></div>
                  </div>
                </div>
                <canvas class="analytics-line-large chartjs-render-monitor" id="analyticOvData" width="576" height="175" style="display: block; width: 576px; height: 175px;"></canvas>
              </div>
              <div class="chart-label-group ms-5">
                <div class="chart-label">01 Jan, 2020</div>
                <div class="chart-label d-none d-sm-block">15 Jan, 2020</div>
                <div class="chart-label">30 Jan, 2020</div>
              </div>
            </div>
          </div>
        </div>
      </div> -->
      <!-- <div class="col-md-6 col-xxl-3">
        <div class="card card-bordered card-full h-100">
          <div class="card-inner-group">
            <div class="card-inner">
              <div class="card-title-group">
                <div class="card-title">
                  <h6 class="title">New Customer</h6>
                </div>
                <div class="card-tools">
                  <a href="/demo1/hotel/customers.html" class="link">View All</a>
                </div>
              </div>
            </div>
            <div class="card-inner card-inner-md">
              <div class="user-card">
                <div class="user-avatar bg-primary-dim"><span>AB</span></div>
                <div class="user-info">
                  <span class="lead-text">Abu Bin Ishtiyak</span>
                  <span class="sub-text">info@softnio.com</span>
                </div>
                <div class="user-action">
                  <div class="drodown">
                    <a href="#" class="dropdown-toggle btn btn-icon btn-trigger me-n1" data-bs-toggle="dropdown" aria-expanded="false">
                      <em class="icon ni ni-more-h"></em>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end">
                      <ul class="link-list-opt no-bdr">
                        <li><a href="#"><em class="icon ni ni-setting"></em><span>Action Settings</span></a></li>
                        <li><a href="#"><em class="icon ni ni-notify"></em><span>Push Notification</span></a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-inner card-inner-md">
              <div class="user-card">
                <div class="user-avatar bg-pink-dim">
                  <span>SW</span>
                </div>
                <div class="user-info">
                  <span class="lead-text">Sharon Walker</span>
                  <span class="sub-text">sharon-90@example.com</span>
                </div>
                <div class="user-action">
                  <div class="drodown">
                    <a href="#" class="dropdown-toggle btn btn-icon btn-trigger me-n1" data-bs-toggle="dropdown" aria-expanded="false">
                      <em class="icon ni ni-more-h"></em>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end">
                      <ul class="link-list-opt no-bdr">
                        <li><a href="#"><em class="icon ni ni-setting"></em><span>Action Settings</span></a></li>
                        <li><a href="#"><em class="icon ni ni-notify"></em><span>Push Notification</span></a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-inner card-inner-md">
              <div class="user-card">
                <div class="user-avatar bg-warning-dim"><span>GO</span></div>
                <div class="user-info">
                  <span class="lead-text">Gloria Oliver</span>
                  <span class="sub-text">gloria_72@example.com</span>
                </div>
                <div class="user-action">
                  <div class="drodown">
                    <a href="#" class="dropdown-toggle btn btn-icon btn-trigger me-n1" data-bs-toggle="dropdown" aria-expanded="false">
                      <em class="icon ni ni-more-h"></em>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end">
                      <ul class="link-list-opt no-bdr">
                        <li><a href="#"><em class="icon ni ni-setting"></em><span>Action Settings</span></a></li>
                        <li><a href="#"><em class="icon ni ni-notify"></em><span>Push Notification</span></a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-inner card-inner-md">
              <div class="user-card">
                <div class="user-avatar bg-success-dim"><span>PS</span></div>
                <div class="user-info">
                  <span class="lead-text">Phillip Sullivan</span>
                  <span class="sub-text">phillip-85@example.com</span>
                </div>
                <div class="user-action">
                  <div class="drodown">
                    <a href="#" class="dropdown-toggle btn btn-icon btn-trigger me-n1" data-bs-toggle="dropdown" aria-expanded="false">
                      <em class="icon ni ni-more-h"></em>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end">
                      <ul class="link-list-opt no-bdr">
                        <li><a href="#"><em class="icon ni ni-setting"></em><span>Action Settings</span></a></li>
                        <li><a href="#"><em class="icon ni ni-notify"></em><span>Push Notification</span></a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-inner card-inner-md">
              <div class="user-card">
                <div class="user-avatar bg-danger-dim"><span>TI</span></div>
                <div class="user-info">
                  <span class="lead-text">Tasnim Ifrat</span>
                  <span class="sub-text">tasif-85@example.com</span>
                </div>
                <div class="user-action">
                  <div class="drodown">
                    <a href="#" class="dropdown-toggle btn btn-icon btn-trigger me-n1" data-bs-toggle="dropdown" aria-expanded="false">
                      <em class="icon ni ni-more-h"></em>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end">
                      <ul class="link-list-opt no-bdr">
                        <li><a href="#"><em class="icon ni ni-setting"></em><span>Action Settings</span></a></li>
                        <li><a href="#"><em class="icon ni ni-notify"></em><span>Push Notification</span></a></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-6 col-xxl-4">
        <div class="card card-bordered card-full h-100">
          <div class="card-inner border-bottom">
            <div class="card-title-group">
              <div class="card-title">
                <h6 class="title">Recent Activities</h6>
              </div>
              <div class="card-tools">
                <ul class="card-tools-nav">
                  <li><a href="#"><span>Cancel</span></a></li>
                  <li class="active"><a href="#"><span>All</span></a></li>
                </ul>
              </div>
            </div>
          </div>
          <ul class="nk-activity">
            <li class="nk-activity-item">
              <div class="nk-activity-media user-avatar bg-success">
                <img src="/demo1/images/avatar/c-sm.jpg" alt="">
              </div>
              <div class="nk-activity-data">
                <div class="label">Keith Jensen requested for room.</div>
                <span class="time">2 hours ago</span>
              </div>
            </li>
            <li class="nk-activity-item">
              <div class="nk-activity-media user-avatar bg-warning">HS</div>
              <div class="nk-activity-data">
                <div class="label">Harry Simpson placed a Order.</div>
                <span class="time">2 hours ago</span>
              </div>
            </li>
            <li class="nk-activity-item">
              <div class="nk-activity-media user-avatar bg-azure">SM</div>
              <div class="nk-activity-data">
                <div class="label">Stephanie Marshall cancelled booking.</div>
                <span class="time">2 hours ago</span></div>
              </li>
              <li class="nk-activity-item">
                <div class="nk-activity-media user-avatar bg-purple">
                  <img src="/demo1/images/avatar/d-sm.jpg" alt=""></div>
                  <div class="nk-activity-data">
                    <div class="label">Nicholas Carr confirmed booking.</div>
                    <span class="time">2 hours ago</span>
                  </div>
                </li>
                <li class="nk-activity-item">
                  <div class="nk-activity-media user-avatar bg-pink">TM</div>
                  <div class="nk-activity-data">
                    <div class="label">Timothy Moreno placed a Order.</div>
                    <span class="time">2 hours ago</span>
                  </div>
                </li>
              </ul>
            </div>
          </div>
        </div>-->
      </div> 
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
@endsection

@section('footerscript')
<script src="{{ URL::asset('assests/js/bundle.js') }}"></script>
<script src="{{ URL::asset('assests/js/customchart.js') }}"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script>
  var artistjson = <?php echo $artistjson; ?>;
  var myArray = JSON.parse(JSON.stringify(artistjson));
  console.log(myArray.label);
  var group_chart2 = $('#doughnut_chart');
  var chart_data = {
    labels:myArray.label,
		datasets:[
      {
        label:'Artists',
        backgroundColor:myArray.bgcolor,
        color:'#fff',
        data:myArray.count,
        //hoverOffset: 4
			}
		]
	};

  var graph2 = new Chart(group_chart2, {
    type:"doughnut",
    data:chart_data,
  });
</script>
@endsection