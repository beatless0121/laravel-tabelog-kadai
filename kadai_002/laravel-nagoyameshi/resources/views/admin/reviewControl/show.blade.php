@extends('layouts.app')

@section('content')
    <div class="col container">
        <div class="row justify-content-center">
            <div class="col-xl-7 col-lg-8 col-md-9">
                <nav class="mb-4" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="{{ route('admin.reviewControl.index') }}">レビュー管理一覧</a></li>
                        <li class="breadcrumb-item active" aria-current="page">レビュー詳細</li>
                    </ol>
                    
                    <h1 class="mb-4 text-center">{{ $reviewControls->member_name }}</h1>

                <div class="d-flex justify-content-end align-items-end mb-3">
                    <div style="display:flex;">
                       <form action="{{ route('admin.reviewControl.update',$reviewControls->id) }}" method="post" name="unrelease_flgForm">
                             @csrf
                             @method('patch')
                             <input type="hidden" id="release_flg" name="release_flg" value="0" />
                             <button id="release0" type="submit" class="btn text-white shadow-sm nagoyameshi-btn">公開</button>
                        </form>
                       <form action="{{ route('admin.reviewControl.update',$reviewControls->id) }}" method="post" name="unrelease_flgForm">
                             @csrf
                             @method('patch')
                             <input type="hidden" id="release_flg" name="release_flg" value="1" />
                            <button type="submit" class="btn text-white shadow-sm nagoyameshi-btn-danger">非公開</button>
                        </form>
                  </div>
                </div>
                
                <div class="container mb-4">
                  <div class="row pb-2 mb-2 border-bottom">
                       <div class="col-2">
                            <span class="fw-bold">レビュー</span>
                        </div>

                        <div class="col">
                           <span>{{ $reviewControls->content }}</span>
                       </div>
                    </div>

                   <div class="row pb-2 mb-2 border-bottom">
                        <div class="col-2">
                            <span class="fw-bold">レビューID</span>
                        </div>

                        <div class="col">
                            <span>{{ $reviewControls->id }}</span>
                        </div>
                    </div>

                    <div class="row pb-2 mb-2 border-bottom">
                        <div class="col-2">
                            <span class="fw-bold">評価</span>
                        </div>

                        <div class="col">
                            <span>{{ $reviewControls->score }}</span>
                        </div>
                    </div>

                    <div class="row pb-2 mb-2 border-bottom">
                        <div class="col-2">
                            <span class="fw-bold">店舗名</span>
                        </div>

                        <div class="col">
                            <span>{{ $reviewControls->shop_name }}</span>
                        </div>
                    </div>

                    <div class="row pb-2 mb-2 border-bottom">
                        <div class="col-2">
                            <span class="fw-bold">会員名</span>
                        </div>

                        <div class="col">
                            <span>{{ $reviewControls->member_name }}</span>
                        </div>
                    </div>

                    <div class="row pb-2 mb-2 border-bottom">
                        <div class="col-2">
                            <span class="fw-bold">メールアドレス</span>
                        </div>

                        <div class="col">
                            <span>{{ $reviewControls->member_email }}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection