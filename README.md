# Mel Heal Habit

○アプリケーション概要

サイト内で提供された豊富なメニューの中から、<br>
食事を楽しみながら、体の管理、記録を行い<br>
ストレスフリーで理想の体型を目指す<br>
食事管理型ウェブアプリケーションです。


○機能一覧

管理者側

・管理者ログイン,ログアウト機能(devise)

・メニュー一覧表示機能

・新規メニュー登録機能

・画像アップロード機能(carrierwave)

・メニュー削除機能

・登録ユーザー一覧機能

・登録ユーザー詳細機能

エンドユーザー側

・ログイン、ログアウト、サインアップ機能(devise)

・メニュー一覧表示機能

・メニュー詳細表示機能

・ページネーション機能(kaminari)

・マイページ目標投稿機能

・マイページ目標編集機能

・登録情報編集機能

・ユーザー退会機能(paranoia)

・ログインユーザー維持カロリー測定機能

・メニューを食べて食事記録として表示する機能

・維持カロリーから食事記録を引いて残りカロリーを表示する機能

・日毎の消費カロリーを月グラフで表示する機能(Chart.js)

◯使用技術一覧

サーバーサイド

・言語 ：Ruby 2.5.5

フレームワーク：Ruby On Rails 5.2.3

フロントエンド

・CSSフレームワーク ：BootStrap

・JavaScriptライブラリ：jQuery、スライダー

本番サーバ環境

・AWS

データベース

・MySQL

WEBサーバ

・nginx

