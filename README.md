# Chameleon Material FX（カメレオンマテリアルFX）

専用のpmxコントローラーでモデルのテクスチャの色を自由に変更できるエフェクトです。

## 概要
- 対応シェーダー：ray-mmd / sdPBR
- 特徴：HSV制御・RGB制御の2パターンを同梱。テクスチャ画像の編集なしでも色を自由自在に変えられます。
- 使い方：詳細は[wikiページ](https://github.com/sakusya/chameleon-material-fx/wiki)を参照してください。

## Download（ダウンロード）

お使いのシェーダーに合わせて、以下のいずれかをダウンロードしてください。

- [Chameleon Material FX for Ray-MMD(zip)]()(updated:2026.04.05)
- [Chameleon Material FX for sdPBR(zip)]()(updated:2026.04.05)

## Quick Start (クイックスタート)

### 1.ファイルの配置
解凍した`Chameleon_HSV`フォルダ, `Chameleon_RGB`フォルダを以下に配置してください。

#### Ray-MMDの場合
- `ray-mmd\Materials\Chameleon_HSV`
- `ray-mmd\Materials\Chameleon_RGB`

#### sdPBRの場合
- `sdPBR\material\Chameleon_HSV`
- `sdPBR\material\Chameleon_RGB`

### 2. MMEでの割り当て
MMD右上の「MMEffect」パネルを開き、以下の手順で割り当ててください。

#### ray-mmd の場合
1. `MaterialMap` タブを選択します。
2. 適用したいモデルの材質（例：髪など）に対し、`ray_chameleon_XXX.fx` を割り当てます。

#### sdPBR の場合
1. `Main` タブを選択します。
2. 適用したい材質に対し、`sdPBR_chameleon_XXX.fx` を割り当てます。

### 3. コントローラーの使用（任意）
付属の `ChameleonController.pmx` をMMDに読み込むことで、色味や変化の速度をモーフでリアルタイムに調整できます。


## 利用規約
本リポジトリ内の[LICENSE.txt](https://github.com/sakusya/chameleon-material-fx?tab=License-1-ov-file)を必ずご確認ください。
- 個人での商用利用：OK
- クレジット表記：任意
- 改造、改変禁止モデルへの使用：禁止
- 上記のパーツを流用したモデルへの使用：禁止
- そのままの再配布：禁止
- 改変物の配布：「.fx」「.fxsub」「コントローラー(.pmx)」に限り許可
- 公序良俗に反する行為、政治・宗教活動への利用、または特定の個人や団体を誹謗中傷する目的での利用：禁止

## 制作者
- sakusya（@aysukasakusya）

## Preview

## Credit
使用モデル
Virtu-A-Dolls 04: 凌香 F ウェンデル (フリー) by VRキャラクター製作所 (カフジ)
