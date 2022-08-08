@extends('layouts.auth')

@section('content')
<div class="login-box">
  <div class="login-logo">
  <a href="{{ url('/') }}">
     @if(!empty(App\Http\Helpers\Helper::websetting('logoimage')))
        <img src="{{asset(App\Http\Helpers\Helper::websetting('logoimage'))}}" alt="{{App\Http\Helpers\Helper::websetting('sitename') ?? 'ArtistBooking'}}" class="brand-image" style="opacity: .8;">
     @else
      <img src="{{ URL::asset('assests/dist/img/AdminLTELogo.png') }}" alt="{{App\Http\Helpers\Helper::websetting('sitename') ?? 'ArtistBooking'}}" class="brand-image img-circle elevation-3" style="opacity: .8;">
     @endif
     </a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">You are only one step a way from your new password, recover your password now.</p>

      <form action="{{ route('password.update') }}" method="post" >
        @csrf
        <input type="hidden" name="code" value="{{ $token }}">

        <div class="input-group mb-3">
          <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" placeholder="Email" name="email" value="{{ $passwordReset->email ?? old('email') }}" required autocomplete="email" autofocus>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
        @error('email')
            <span class="invalid-feedback" role="alert">
                <strong>{{ $message }}</strong>
            </span>
        @enderror
        </div>

        <div class="input-group mb-3">
          <input id="password" type="password" class="form-control  @error('password') is-invalid @enderror" placeholder="Password" name="password" required autocomplete="new-password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        @error('password')
            <span class="invalid-feedback" role="alert">
                <strong>{{ $message }}</strong>
            </span>
        @enderror
        </div>
        <div class="input-group mb-3">
          <input id="password-confirm" type="password" class="form-control" placeholder="Confirm Password" name="password_confirmation" required autocomplete="new-password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
            <button type="submit" class="btn btn-primary btn-block">Reset Password</button>
          </div>
          <!-- /.col -->
        </div>
      </form>

      <p class="mt-3 mb-1">
        <a href="{{ route('login') }}">Login</a>
      </p>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
@endsection