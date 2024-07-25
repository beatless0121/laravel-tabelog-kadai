@extends('layouts.app')

@push('fonts')
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@400;600&display=swap" rel="stylesheet">
@endpush

@push('styles')
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css">
@endpush

@push('scripts')
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    <script src="{{ asset('/js/carousel.js') }}"></script>
@endpush

@section('content')
    <div>
        <div class="swiper nagoyameshi-swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide"><img src="{{ asset('/images/main1.jpg') }}"></div>
                <div class="swiper-slide"><img src="{{ asset('/images/main2.jpg') }}"></div>
                <div class="swiper-slide"><img src="{{ asset('/images/main3.jpg') }}"></div>
                <div class="d-flex align-items-center nagoyameshi-overlay-background">
                    <div class="container nagoyameshi-container nagoyameshi-overlay-text">
                        <h1 class="text-white nagoyameshi-catchphrase-heading">名古屋ならではの味を、<br>見つけよう</h1>
                        <p class="text-white nagoyameshi-catchphrase-paragraph">NAGOYAMESHIは、<br>名古屋市のB級グルメ専門のレビューサイトです。</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @if (session('flash_message'))
        <div class="container nagoyameshi-container my-3">
            <div class="alert alert-info" role="alert">
                <p class="mb-0">{{ session('flash_message') }}</p>
            </div>
        </div>
    @endif

    <div class="bg-light mb-4 py-4">
        <div class="container nagoyameshi-container">
            <h2 class="mb-3">キーワードから探す</h2>
            <form method="GET" action="{{ route('shops.index') }}" class="nagoyameshi-user-search-box">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="店舗名・エリア・カテゴリ" name="keyword">
                    <button type="submit" class="btn text-white shadow-sm nagoyameshi-btn">検索</button>
                </div>
            </form>
        </div>
    </div>

    <div class="container nagoyameshi-container">
        <h2 class="mb-3">評価が高いお店</h2>
        <div class="row row-cols-xl-6 row-cols-md-3 row-cols-2 g-3 mb-5">
            @foreach ($highly_rated_shops as $highly_rated_shop)
                <div class="col">
                    <a href="{{ route('shops.show', $highly_rated_shop) }}" class="link-dark nagoyameshi-card-link">
                        <div class="card h-100">
                            @if ($highly_rated_shop->image !== '')
                                <img src="{{ asset('storage/shops/' . $highly_rated_shop->image) }}" class="card-img-top nagoyameshi-vertical-card-image">
                            @else
                                <img src="{{ asset('/images/no_image.jpg') }}" class="card-img-top nagoyameshi-vertical-card-image" alt="画像なし">
                            @endif
                            <div class="card-body">
                                <h3 class="card-title">{{ $highly_rated_shop->name }}</h3>
                                <div class="text-muted small mb-1">
                                    @if ($highly_rated_shop->categories()->exists())
                                        @foreach ($highly_rated_shop->categories as $index => $category)
                                            <div class="d-inline-block">
                                                @if ($index === 0)
                                                    {{ $category->name }}
                                                @else
                                                    {{ ' ' . $category->name }}
                                                @endif
                                            </div>
                                        @endforeach
                                    @else
                                        <span>カテゴリ未設定</span>
                                    @endif
                                </div>
                                <p class="card-text">
                                    <span class="nagoyameshi-star-rating me-1" data-rate="{{ round($highly_rated_shop->reviews->avg('score') * 2) / 2 }}"></span>
                                    {{ number_format(round($highly_rated_shop->reviews->avg('score'), 2), 2) }}
                                </p>
                            </div>
                        </div>
                    </a>
                </div>
            @endforeach
        </div>

        <h2 class="mb-3">カテゴリから探す</h2>
        <div class="row row-cols-xl-6 row-cols-md-3 row-cols-2 g-3 mb-3">
            <div class="col">
                <a href="{{ url("/shops/?category_id={$categories->where('name', '和食')->value('id')}") }}" class="nagoyameshi-card-link">
                    <div class="card text-white">
                        <img src="{{ asset('/images/washoku.jpg') }}" class="card-img nagoyameshi-vertical-card-image" alt="和食">
                        <div class="card-img-overlay d-flex justify-content-center align-items-center nagoyameshi-overlay-background">
                            <h3 class="card-title nagoyameshi-category-name">和食</h5>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col">
                <a href="{{ url("/shops/?category_id={$categories->where('name', 'うどん')->value('id')}") }}" class="nagoyameshi-card-link">
                    <div class="card text-white">
                        <img src="{{ asset('/images/udon.jpg') }}" class="card-img nagoyameshi-vertical-card-image" alt="うどん">
                        <div class="card-img-overlay d-flex justify-content-center align-items-center nagoyameshi-overlay-background">
                            <h3 class="card-title nagoyameshi-category-name">うどん</h5>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col">
                <a href="{{ url("/shops/?category_id={$categories->where('name', '丼物')->value('id')}") }}" class="nagoyameshi-card-link">
                    <div class="card text-white">
                        <img src="{{ asset('/images/don.jpg') }}" class="card-img nagoyameshi-vertical-card-image" alt="丼物">
                        <div class="card-img-overlay d-flex justify-content-center align-items-center nagoyameshi-overlay-background">
                            <h3 class="card-title nagoyameshi-category-name">丼物</h5>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col">
                <a href="{{ url("/shops/?category_id={$categories->where('name', 'ラーメン')->value('id')}") }}" class="nagoyameshi-card-link">
                    <div class="card text-white">
                        <img src="{{ asset('/images/ramen.jpg') }}" class="card-img nagoyameshi-vertical-card-image" alt="ラーメン">
                        <div class="card-img-overlay d-flex justify-content-center align-items-center nagoyameshi-overlay-background">
                            <h3 class="card-title nagoyameshi-category-name">ラーメン</h5>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col">
                <a href="{{ url("/shops/?category_id={$categories->where('name', 'おでん')->value('id')}") }}" class="nagoyameshi-card-link">
                    <div class="card text-white">
                        <img src="{{ asset('/images/oden.jpg') }}" class="card-img nagoyameshi-vertical-card-image" alt="おでん">
                        <div class="card-img-overlay d-flex justify-content-center align-items-center nagoyameshi-overlay-background">
                            <h3 class="card-title nagoyameshi-category-name">おでん</h5>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col">
                <a href="{{ url("/shops/?category_id={$categories->where('name', '揚げ物')->value('id')}") }}" class="nagoyameshi-card-link">
                    <div class="card text-white">
                        <img src="{{ asset('/images/fried.jpg') }}" class="card-img nagoyameshi-vertical-card-image" alt="揚げ物">
                        <div class="card-img-overlay d-flex justify-content-center align-items-center nagoyameshi-overlay-background">
                            <h3 class="card-title nagoyameshi-category-name">揚げ物</h5>
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <div class="mb-5">
            @foreach ($categories as $category)
                @if ($category->name === '和食' || $category->name === 'うどん' || $category->name === '丼物' || $category->name === 'ラーメン' || $category->name === 'おでん' || $category->name === '揚げ物')
                    @continue
                @else
                    <a href="{{ url("/shops/?category_id={$category->id}") }}" class="btn btn-outline-secondary btn-sm me-1 mb-2">{{ $category->name }}</a>
                @endif
            @endforeach
        </div>

        <h2 class="mb-3">新規掲載店</h2>
        <div class="row row-cols-xl-6 row-cols-md-3 row-cols-2 g-3 mb-5">
            @foreach ($new_shops as $new_shop)
                <div class="col">
                    <a href="{{ route('shops.show', $new_shop) }}" class="link-dark nagoyameshi-card-link">
                        <div class="card h-100">
                            @if ($new_shop->image !== '')
                                <img src="{{ asset('storage/shops/' . $new_shop->image) }}" class="card-img-top nagoyameshi-vertical-card-image">
                            @else
                                <img src="{{ asset('/images/no_image.jpg') }}" class="card-img-top nagoyameshi-vertical-card-image" alt="画像なし">
                            @endif
                            <div class="card-body">
                                <h3 class="card-title">{{ $new_shop->name }}</h3>
                                <div class="text-muted small mb-1">
                                    @if ($new_shop->categories()->exists())
                                        @foreach ($new_shop->categories as $index => $category)
                                            <div class="d-inline-block">
                                                @if ($index === 0)
                                                    {{ $category->name }}
                                                @else
                                                    {{ ' ' . $category->name }}
                                                @endif
                                            </div>
                                        @endforeach
                                    @else
                                        <span>カテゴリ未設定</span>
                                    @endif
                                </div>
                                <p class="card-text">{{ mb_substr($new_shop->description, 0, 19) }}@if (mb_strlen($new_shop->description) > 19)...@endif</p>
                            </div>
                        </div>
                    </a>
                </div>
            @endforeach
        </div>
    </div>
@endsection
