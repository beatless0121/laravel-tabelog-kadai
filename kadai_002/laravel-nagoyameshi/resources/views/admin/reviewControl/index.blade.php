@extends('layouts.app')

@section('content')
    <div class="col container">
        <div class="row justify-content-center">
            <div class="col-xxl-9 col-xl-10 col-lg-11">
                <h1 class="mb-4 text-center">レビュー管理一覧</h1>

                <div class="d-flex justify-content-between align-items-end flex-wrap">
                    <form method="GET" action="{{ route('admin.shops.index') }}" class="nagoyameshi-admin-search-box mb-3">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="店舗名・メールアドレスで検索" name="keyword" value="{{ $keyword }}">
                            <button type="submit" class="btn text-white shadow-sm nagoyameshi-btn">検索</button>
                        </div>
                    </form>
                </div>

                @if (session('flash_message'))
                    <div class="alert alert-info" role="alert">
                        <p class="mb-0">{{ session('flash_message') }}</p>
                    </div>
                @endif

                <div>
                    <p class="mb-0">計{{ number_format($total) }}件</p>
                </div>

                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">店舗名</th>
                            <th scope="col">会員名</th>
                            <th scope="col">メールアドレス</th>
                            <th scope="col">公開</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($reviewControls as $reviewControl)
                            <tr>
                                <td>{{ $reviewControl->id }}</td>
                                <td>{{ $reviewControl->shop_name }}</td>
                                <td>{{ $reviewControl->member_name }}</td>
                                <td>{{ $reviewControl->member_email }}</td>
                                <td>{{ $reviewControl->release_flg }} </td>
                                <td><a href="{{ route('admin.reviewControl.show', $reviewControl->id) }}">詳細</a></td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection