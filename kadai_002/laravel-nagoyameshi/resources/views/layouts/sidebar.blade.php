<div class="col-2 nagoyameshi-admin-sidebar">
    <div class="list-group">
        <a class="list-group-item list-group-item-action" href="{{ route('admin.home') }}">ホーム</a>
        <a class="list-group-item list-group-item-action" href="{{ route('admin.members.index') }}">会員一覧</a>
        <a class="list-group-item list-group-item-action" href="{{ route('admin.shops.index') }}">店舗一覧</a>
        <a class="list-group-item list-group-item-action" href="{{ route('admin.categories.index') }}">カテゴリ一覧</a>
        <a class="list-group-item list-group-item-action" href="{{ route('admin.company.index') }}">会社概要</a>
        <a class="list-group-item list-group-item-action" href="{{ route('admin.terms.index') }}">利用規約</a>
        <!-- レビュー管理機能追加の為 -->
        <a class="list-group-item list-group-item-action" href="{{ route('admin.reviewControl.index') }}">レビュー管理</a>
    </div>
</div>