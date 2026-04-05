# Chameleon Material FX（カメレオンマテリアルFX）

専用のpmxコントローラーでモデルのテクスチャの色を自由に変更できるエフェクトです。

## 概要
- 対応シェーダー：ray-mmd / sdPBR
- 特徴：HSV制御・RGB制御の2パターンを同梱。テクスチャ画像の編集なしでも色を自由自在に変えられます。
  - HSV制御 (`Chameleon_HSV`)：直感的に「色相」や「鮮やかさ」を変えたい場合に適しています。
  - RGB制御 (`Chameleon_RGB`)：特定の色の強さを精密に制御したい場合に適しています。
- 使い方：後述の[Quick Start (クイックスタート)](#quick-start-クイックスタート)で説明します。詳細は[wikiページ](https://github.com/sakusya/chameleon-material-fx/wiki)を参照してください。

## Download（ダウンロード）

お使いのシェーダーに合わせて、以下のいずれかをダウンロードしてください。

- [Chameleon Material FX for Ray-MMD(zip)]()(updated:2026.04.05)
- [Chameleon Material FX for sdPBR(zip)]()(updated:2026.04.05)

## Quick Start (クイックスタート)

### 1.ファイルの配置
解凍した`Chameleon_HSV`フォルダ, `Chameleon_RGB`フォルダを以下に配置してください。

#### Ray-MMDの場合
- お使いの`ray-mmd\Materials`フォルダ内へ配置してください。
#### sdPBRの場合
- お使いの`sdPBR\material`フォルダ内へ配置してください。

### 2. MMEでの割り当て
MMD右上の「MMEffect」パネルを開き、以下の手順で割り当ててください。

#### ray-mmd の場合
1. `MaterialMap` タブを選択します。
2. 適用したいモデルの材質に対し、`XXX_cham.fx` を割り当てます。

#### sdPBR の場合
1. `Main` タブを選択します。
2. 適用したいモデルの材質に対し、`sdPBR_XXX_cham.fx` を割り当てます。

### 3. コントローラーの使用

色味を調整するには、使用しているエフェクトと同じフォルダにある`.pmx`ファイルを読み込んでください。

| 対象シェーダー | 参照するフォルダ | 読み込むコントローラー (.pmx) |
| :--- | :--- | :--- |
| Ray-MMD | Chameleon_HSV | `ray_chameleon_controller_HSV.pmx` |
| Ray-MMD | Chameleon_RGB | `ray_chameleon_controller_RGB.pmx` |
| sdPBR | Chameleon_HSV | `sdPBRChameleonControllerHSV.pmx` |
| sdPBR | Chameleon_RGB | `sdPBRChameleonControllerRGB.pmx` |

#### 使い方
MMDの「表情操作（モーフ）」パネルから、以下の調整が可能です。
| 対象コントローラー | モーフ名 | 説明 |
| :--- | :--- | :--- |
| HSV版コントローラー | `H (Hue) `| 色相（色の種類）を調整します。 |
|  | `S (Saturation)` | 鮮やかさを調整します。|
|  | `V (Value)` | 明るさを調整します。 |
|  |  |  |
| RGB版コントローラー | `R+ (Red)` | 赤の成分の強さを調整します。 |
|  | `G+ (Green)` | 緑の成分の強さを調整します。 |
|  | `B+ (Blue)` | 青の成分の強さを調整します。 |
|  | `V- (Value)` | 全体の明るさを一括で調整します。 |


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
