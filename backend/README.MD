# InstaFlash Backend

FastAPI tabanlı backend uygulaması.  
Gemini API üzerinden flashcard (soru-cevap kartı) üretir.  
Flutter mobil uygulaması bu servisi kullanır.

---

## 🚀 Kurulum Adımları

### 1️⃣ Reposu klonla veya indir

```bash
git clone https://github.com/Atamandrl/instaflash.git
cd instaflash/backend
```

Veya klasörü ZIP olarak alıp açın.

---

### 2️⃣ Sanal ortam (virtual environment) oluştur

**Windows:**
```powershell
python -m venv venv
venv\Scripts\activate
```

**Mac/Linux:**
```bash
python3 -m venv venv
source venv/bin/activate
```

---

### 3️⃣ Gerekli Python paketlerini yükle

```bash
pip install -r requirements.txt
```

Eğer `requirements.txt` yoksa manuel yükleyin:

```bash
pip install fastapi uvicorn python-dotenv requests
```

---

### 4️⃣ Ortam değişkeni dosyasını oluştur

Önce `.env.example` dosyasını `.env` olarak kopyalayın:

**Windows:**
```powershell
copy .env.example .env
```

**Mac/Linux:**
```bash
cp .env.example .env
```

`.env` dosyasını açıp kendi API key'inizi yazın:

```ini
GEMINI_API_KEY=YOUR_API_KEY_HERE
```

Her ekip üyesi kendi key’ini kullanmalıdır.

---

### 5️⃣ Sunucuyu başlat

```bash
uvicorn main:app --reload
```

Başarılı olursa şu mesaj çıkar:

```
Uvicorn running on http://127.0.0.1:8000
```

---

## 🧪 API Testi

Tarayıcıdan şunu açın:

```
http://127.0.0.1:8000/docs
```

Swagger arayüzünde `POST /generate-cards` endpoint’ini deneyin.

### Örnek istek:

```json
{
  "topic": "General Knowledge"
}
```

### Örnek yanıt:

```json
{
  "cards": [
    {"question": "What is the capital of France?", "answer": "Paris"},
    {"question": "...", "answer": "..."}
  ]
}
```

---

## ⚙️ Dosya Yapısı

```
instaflash/
├── backend/
│   ├── main.py            # FastAPI uygulaması
│   ├── .env.example       # Ortam değişkeni şablonu
│   ├── requirements.txt   # Gerekli kütüphaneler
│   └── README.md          # Bu dosya
```

---

## ⚠️ Notlar

- `.env` dosyanızı GitHub’a yüklemeyin (gizli API key içerir)
- API key’i şuradan alınabilir:  
  👉 [https://makersuite.google.com/app/apikey](https://makersuite.google.com/app/apikey)
- Ortak key kullanılacaksa Google Console’dan kota limiti belirleyin
- Key kazara paylaşılırsa hemen silip yenisini oluşturun
