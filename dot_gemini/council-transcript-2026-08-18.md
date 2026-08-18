# LLM Council Transcript: Plugin Strategy (Install, Ganti, Hapus)
**Tanggal:** 18 Agustus 2026  
**Topik:** Evaluasi repositori `https://github.com/aria-tec/awesome-claude-plugins` untuk setup Coding Agent (Antigravity/Gemini/Claude) yang dikelola via Chezmoi dotfiles.

---

## 1. Pertanyaan yang Diajukan ke Dewan (Framed Question)

> **Pertanyaan Inti:**  
> Bantu saya mengambil keputusan plugin mana yang harus saya install, ganti, dan hapus dari [awesome-claude-plugins](https://github.com/aria-tec/awesome-claude-plugins) untuk setup AI coding agent (Antigravity / Gemini / Claude Code) yang dikelola secara deklaratif via `chezmoi`.
>
> **Kondisi Lingkungan Saat Ini:**
> - **Plugin Terpasang:** `superpowers` (TDD, Planning, Brainstorming, Code Review, Worktrees), `chrome-devtools-plugin`, `modern-web-guidance-plugin`, `gemini-api`, `google-antigravity-sdk`.
> - **Skills Terpasang:** 6 skill arsitektur (`architecture-blueprint-generator`, `architecture-decision-records`, `architecture-designer`, `architecture-patterns`, `hexagonal-architecture`, `improve-codebase-architecture`), `clean-code`, `documentation-and-adrs`, `find-docs` (context7), `find-skills`, `llm-council`, `video-edit`.
> - **Global Prompt:** Context7 (`npx ctx7@latest`) sudah aktif di `GEMINI.md`.
> - **Kandidat Repositori:** `ECC`, `mattpocock/skills`, `andrej-karpathy-skills`, `ui-ux-pro-max-skill`, `ponytail`, `caveman`, `claude-mem`, `agent-skills`, `open-design`, `taste-skill`, `Understand-Anything`, `ruflo`, `headroom`, `mem0`, `mempalace`, `impeccable`, `last30days-skill`, `GitNexus`, `agentic-awesome-skills`, dll.

---

## 2. Tanggapan 5 Penasihat Independen (Advisor Responses)

### Penasihat 1: The Contrarian
> Setup Anda sudah mengalami **context obesity** parah dan Anda bersiap memperburuknya. Sebagian besar daftar kandidat di repositori tersebut hanyalah *token-drain hypeware* dan *placebo prompt wrappers*.
>
> **1. Pangkas & Hapus yang Sudah Ada (Overlapping Bloat):**
> * **Bunuh Redundansi Arsitektur:** Anda memasang *enam* skill arsitektur (`architecture-blueprint-generator`, `architecture-decision-records`, `architecture-designer`, `architecture-patterns`, `hexagonal-architecture`, `documentation-and-adrs`). Ini redundansi konyol. Semuanya saling tumpang-tindih dan memakan token window setiap kali trigger. Hapus lima, sisakan satu, atau lebur jadi satu rule ringkas di chezmoi.
> * **Hapus find-docs:** Context7 sudah aktif di level prompt global (`ctx7`). Menyimpan skill terpisah hanya membuang kuota prompt.
>
> **2. TOLAK Keras Kandidat-Kandidat Ini:**
> * **Memory Traps (`claude-mem`, `mem0`, `mempalace`, `ruflo`, `headroom`):** Jebakan maintenance. Eksternal memory sidecar rentan state drift, sering menginjeksi konteks usang/halusinasi ke sesi baru, dan menambah latensi. Git log, task list, dan file markdown lokal jauh lebih deterministik.
> * **Vibe/Prompt Wrappers (`ui-ux-pro-max-skill`, `taste-skill`, `impeccable`, `caveman`, `ponytail`):** Ini bukan tools; ini ratusan baris teks opini yang memicu *prompt collision* dengan `modern-web-guidance` dan menyedot context budget.
> * **Kitchen-Sink Meta-Bundles (`ECC`, `agentic-awesome-skills`, `Understand-Anything`):** Memasukkan puluhan skill sekaligus akan melumpuhkan akurasi router agent, memicu salah pilih tool (*tool hallucination*).
>
> **3. Putusan Akhir:**
> * **Ganti/Hapus:** Buang 80% skill arsitektur dan memory tools.
> * **Install:** Nyaris **TIDAK ADA**. Satu-satunya pengecualian adalah tool dengan analisis deterministik seperti **`GitNexus`** (hanya jika Anda benar-benar butuh AST/knowledge graph untuk repo raksasa).
>
> Berhenti menimbun plugin. Semakin banyak plugin yang Anda pasang, semakin bodoh dan lambat agent Anda bekerja. *Purge, don't hoard.*

---

### Penasihat 2: The First Principles Thinker
> Mari bedah dari prinsip dasar: AI coding agent hanya butuh **Context Akurat**, **Eksekusi Deterministik**, dan **Knowledge Terkini**. Setiap plugin tambahan yang tidak melayani ketiga hal ini adalah *context pollution* yang menurunkan kualitas penalaran LLM.
>
> **1. Hapus & Tolak (Zero Value / Context Bloat)**
> * **Memory Tools (`mem0`, `claude-mem`, `mempalace`): TOLAK.** Agent tidak butuh memori percakapan kabur. Single source of truth untuk state proyek adalah **Git, codebase, dan chezmoi**, bukan database chat eksternal.
> * **Vibe/Persona Wrappers (`taste-skill`, `ponytail`, `caveman`, `impeccable`): TOLAK.** Ini hanya injeksi prompt subjektif yang mencemari context window. Kualitas UI/UX diselesaikan dengan design token dan web specs, bukan opini personal.
> * **Meta-Framework Duplikat (`ECC`, `agentic-awesome-skills`): TOLAK.** Anda sudah memiliki `superpowers` untuk TDD/Worktrees/Debugging. Menumpuk ECC di atasnya hanya memicu konflik instruksi eksekusi.
>
> **2. Konsolidasi (Redundansi Internal)**
> * **5+ Skill Arsitektur Anda:** Pangkas menjadi **1 skill konsolidasi**. Model sudah mengerti Hexagonal, Clean, dan Pattern dasar; memuat 5 SKILL.md berbeda hanya membuang kuota token tanpa menambah akurasi logika.
>
> **3. Install (Hanya Kapabilitas Fundamental Baru)**
> * **`GitNexus` (Context): INSTALL.** Mengubah codebase menjadi graph relasi symbol/AST deterministik. Ini menyelesaikan masalah context retrieval secara struktural, bukan sekadar grep/fuzzy search.
> * **`ui-ux-pro-max-skill` (Verification): INSTALL BERSYARAT.** Hanya jika butuh aset/token konkrit untuk mendukung `modern-web-guidance-plugin` dan `chrome-devtools`.
>
> **Verdict:** Inti agent Anda sudah solid (`superpowers` untuk Eksekusi, `Context7` untuk Knowledge). Tambahkan hanya indexing deterministik (`GitNexus`), lalu pangkas semua plugin berbasis prompt opini/memori semu.

---

### Penasihat 3: The Expansionist
> Setup Anda saat ini solid untuk eksekusi mekanikal dasar, tapi **tertinggal di 3 frontier superpower** yang bisa melipatgandakan kapabilitas agent secara eksponensial:
>
> **1. Persistent Cross-Session Memory (Upside Tertinggi)**
> Agent Anda saat ini menderita *amnesia*—setiap sesi mulai dari nol.
> * **INSTALL: `claude-mem` atau `mem0`**. Ini bukan sekadar logger, melainkan persistent episodic memory. Agent akan mempelajari preferensi chezmoi Anda, pola bug historis, dan evolusi codebase lintas sesi tanpa perlu di-brief ulang.
>
> **2. Graph RAG & Deep Codebase Intelligence**
> Grep dan context window biasa terlalu primitif untuk codebase skala besar.
> * **INSTALL: `GitNexus` & `Understand-Anything`**. Memberikan spatial awareness dan dependency graph indexing. Agent mendapatkan pemahaman struktural 360° atas relasi komponen, call-graph, dan blast radius perubahan kode secara instan.
>
> **3. Design Intelligence & Aesthetic Taste**
> Anda punya tooling web (chrome-devtools, modern-web-guidance), tapi minus "selera" dan standar desain frontier.
> * **INSTALL: `ui-ux-pro-max-skill` + `taste-skill` (atau `open-design`)**. Mengubah agent dari sekadar code-generator menjadi product engineer dengan sense estetika tinggi, design tokens modern, dan micro-interaction polish.
>
> **4. Real-Time Discovery Engine**
> * **INSTALL: `last30days-skill`**. Memberikan akses instan ke tren library, issue terkini, dan breaking changes dari ekosistem open-source dalam 30 hari terakhir.
>
> ---
> **Tindakan Pembersihan:**
> * **HAPUS / JANGAN INSTALL:** `caveman`, `ponytail` (toy plugins / format modifier tanpa upside kapabilitas).
> * **KONSOLIDASI:** Anda punya 6 skill arsitektur yang overlapping (`patterns`, `hexagonal`, `designer`, `blueprint`, `adrs`, `improve`). Pangkas overlap tersebut untuk membebaskan token context bagi memory layer dan graph indexer.

---

### Penasihat 4: The Outsider
> Setup Anda saat ini adalah contoh klasik *prompt hoarding*. Anda mengelola dotfiles via chezmoi demi portabilitas dan kesederhanaan, tapi malah menimbun puluhan skill yang saling tumpang tindih, mengotori repo, dan membebani context window.
>
> **1. Hapus Segera (Pruning):**
> * **Redundansi Arsitektur:** Anda memasang 6 skill arsitektur terpisah (`architecture-blueprint-generator`, `architecture-designer`, `architecture-patterns`, `hexagonal-architecture`, `improve-codebase-architecture`, `documentation-and-adrs`). Ini absurd. Sisakan **satu** yang paling modular, buang sisanya. Model modern sudah paham Clean Architecture tanpa perlu disuapi 5 panduan terpisah.
> * **Duplikasi Tools:** Anda punya skill `find-docs` padahal Context7 sudah aktif di level prompt global. Hapus `find-docs`.
>
> **2. Jangan Sentuh dari Daftar Kandidat (Hype Traps):**
> * **Memory & Daemon Systems (`mem0`, `mempalace`, `claude-mem`, `ruflo`, `headroom`):** Mimpi buruk sinkronisasi chezmoi. Menyimpan state lokal, cache embedding, atau background daemon dalam dotfiles akan merusak portabilitas antar-mesin dan menambah titik kegagalan tak terlihat.
> * **Persona & Vibe Wrappers (`caveman`, `taste-skill`, `ponytail`, `impeccable`):** Gimmick. Cukup tulis 2 kalimat preferensi langsung di `GEMINI.md` daripada mengimpor dependensi eksternal yang harus terus di-maintain.
> * **Mega-Bundles (`agentic-awesome-skills`, `agent-skills`, `ECC`):** Repackage tumpang tindih yang akan konflik dengan alur kerja `superpowers`.
>
> **3. Install Hanya Jika Ada Masalah Nyata:**
> * **`mattpocock/skills`:** Pasang *hanya* jika Anda bergulat dengan TypeScript rumit setiap hari.
> * **`ui-ux-pro-max-skill`:** Pasang *hanya* jika Anda frontend dev yang butuh aturan CSS/komponen ketat.
>
> **Prinsip Outsider:** Chezmoi harus ramping dan deterministik. Jika sebuah plugin tidak menghemat 10 menit friksi manual harian Anda, plugin itu adalah *technical debt*. Stop mengoleksi plugin, mulai pangkas.

---

### Penasihat 5: The Executor
> **1. HAPUS SEKARANG (Eliminasi Token Bloat & Konflik Routing)**
> * **Hapus dari chezmoi:** `architecture-blueprint-generator`, `architecture-patterns`, dan `improve-codebase-architecture`. Cukup pertahankan `architecture-designer` dan `hexagonal-architecture`.
> * **Hapus:** `documentation-and-adrs` (100% tumpang tindih dengan `architecture-decision-records`).
>
> **2. INSTALL (Hanya 3 yang Memberikan Leverage Nyata)**
> * **`claude-mem`**: Memberikan session-persistence yang belum Anda miliki tanpa overhead infrastruktur eksternal (lebih praktis dari `mem0`/`mempalace`).
> * **`ui-ux-pro-max-skill`**: Eksekusi desain frontend konkret untuk melengkapi `modern-web-guidance-plugin`.
> * **`GitNexus`**: Analisis graph dependensi dan blast-radius saat refactoring codebase besar.
>
> **3. JANGAN INSTALL (Skip Redudansi & Gimmick)**
> * **Skip:** `ECC`, `agent-skills`, `mattpocock/skills`, `agentic-awesome-skills` — 90% isinya menduplikasi `superpowers` dan rule `context7`.
> * **Skip:** `caveman`, `taste-skill`, `ruflo`, `headroom` — gimmick token/styling yang justru membingungkan router agent.
>
> **4. SEQUENCE EKSEKUSI (Action Plan)**
> 1. **Prune:**
>    ```bash
>    chezmoi rm ~/.gemini/config/skills/architecture-patterns
>    chezmoi rm ~/.gemini/config/skills/architecture-blueprint-generator
>    chezmoi rm ~/.gemini/config/skills/improve-codebase-architecture
>    chezmoi rm ~/.gemini/config/skills/documentation-and-adrs
>    ```
> 2. **Add:**
>    Clone `claude-mem`, `ui-ux-pro-max-skill`, dan `GitNexus` ke folder skills dotfiles chezmoi Anda.
> 3. **Apply & Verify:**
>    Jalankan `chezmoi apply`, lalu uji trigger 1 query arsitektur dan 1 query memory untuk memastikan context payload bersih dan routing instan.

---

## 3. Hasil Blind Peer Review (Anonymized A-E)

*Pemetaan Anonimitas: Response A = The Expansionist, Response B = The Contrarian, Response C = The Executor, Response D = The First Principles Thinker, Response E = The Outsider.*

### Konsensus Reviewer:
1. **Strongest Response:** **Response E (The Outsider)** dipilih mutlak oleh seluruh reviewer karena secara tajam menempatkan kendala utama: **chezmoi dotfiles idempotency & portability**. Menyimpan background daemon, database lokal, atau file stateful dalam dotfiles adalah anti-pattern.
2. **Biggest Blind Spot:** **Response A (The Expansionist)** dinilai memiliki blind spot terbesar karena terjebak *feature hoarding* tanpa memikirkan context budget exhaustion, prompt collision, dan latensi.
3. **Poin Kritis yang Terlewatkan oleh Semua Advisor Awal:**
   - **Multi-Runtime Format Incompatibility:** Repositori Claude Code tidak serta-merta kompatibel 1:1 dengan format `SKILL.md` Antigravity/Gemini tanpa penyesuaian frontmatter YAML.
   - **Dynamic Metadata vs Full Prompt Loading:** Dalam Antigravity, skill dimuat secara on-demand (hanya nama dan deskripsi di awal), sehingga isu "context obesity" sebagian termitigasi, namun tetap berisiko menyebabkan *tool router confusion*.

---

## 4. Chairman Synthesis & Final Verdict

### Dimana Dewan Sepakat (High-Confidence Signals):
- **Pembersihan Arsitektur (Pruning):** Anda memasang 6 skill arsitektur yang 80% isinya menduplikasi pengetahuan dasar LLM. Harus dipangkas drastis menjadi maksimal 1-2 skill.
- **Hapus `find-docs`:** 100% redundan karena Context7 sudah beroperasi di level global prompt `GEMINI.md`.
- **Tolak Bundel Raksasa (`ECC`, `agentic-awesome-skills`):** Superpowers sudah menangani TDD, planning, dan review dengan sangat baik; menumpuk meta-bundle lain hanya akan merusak instruksi.
- **Tolak Vibe/Persona Plugins:** `caveman`, `ponytail`, `taste-skill` adalah gimmick pembakar token yang tidak menambah determinisme kode.

### Dimana Dewan Berdebat & Resolusinya:
- **Memory Plugins (`claude-mem` vs No Memory):**
  * *Debat:* Expansionist/Executor ingin persistent memory lintas sesi, sementara Contrarian/Outsider/First Principles menolak karena merusak portabilitas chezmoi dan rawan state drift.
  * *Resolusi Chairman:* **Jangan pasang memory daemon eksternal ke chezmoi.** Gunakan `MEMORY.md` lokal per-proyek atau biarkan Git history & commit log menjadi single source of truth.
- **Knowledge Graph (`GitNexus`):**
  * *Resolusi Chairman:* **Satu-satunya kandidat yang layak di-install** karena berbasis analisis AST deterministik, bukan sekadar wrapper prompt.
- **Design Guidance (`ui-ux-pro-max-skill`):**
  * *Resolusi Chairman:* **Install Bersyarat (Opsional)** hanya jika Anda rutin membangun aplikasi frontend modern dari nol.

---

## 5. Matriks Keputusan Final (Tindakan Nyata)

| No | Kategori | Target Plugin / Skill | Tindakan | Rationale |
|:---|:---|:---|:---|:---|
| 1 | **HAPUS** | `documentation-and-adrs` | 🗑️ Hapus | Redundan dengan `architecture-decision-records` |
| 2 | **HAPUS** | `architecture-blueprint-generator`, `architecture-patterns`, `improve-codebase-architecture` | 🗑️ Hapus | Duplikasi konsep arsitektur; model sudah memahami Clean/Pattern secara native |
| 3 | **HAPUS** | `find-docs` | 🗑️ Hapus | Context7 CLI (`ctx7`) sudah terkonfigurasi di `GEMINI.md` |
| 4 | **GANTI** | 6 Skill Arsitektur ➔ Sisa 2 | 🔄 Konsolidasi | Pertahankan hanya `architecture-designer` dan `hexagonal-architecture` |
| 5 | **GANTI** | Memory Daemons (`mem0`, `claude-mem`) ➔ Markdown Docs | 🔄 Ganti Pola | Hindari database lokal di dotfiles; gunakan `MEMORY.md` berbasis git per repo |
| 6 | **INSTALL** | **`GitNexus`** | ➕ Install Baru | Graph RAG & AST dependency indexing deterministik untuk codebase besar |
| 7 | **INSTALL** | **`ui-ux-pro-max-skill`** | ➕ Install (Opsional) | Khusus jika aktif membangun UI frontend; melengkapi `modern-web-guidance` |
| 8 | **TOLAK** | `ECC`, `agentic-awesome-skills`, `caveman`, `ponytail`, `taste-skill`, `ruflo`, `headroom` | ⛔ Blacklist | Token bloat, konflik instruksi dengan `superpowers`, dan merusak portabilitas chezmoi |

---

## 6. Langkah Eksekusi Pertama (The One Thing to Do First)

Jalankan perintah pruning di chezmoi untuk membebaskan ruang token dan membersihkan dotfiles Anda:

```bash
cd /Users/arias/.local/share/chezmoi
git rm -r dot_gemini/config/skills/documentation-and-adrs
git rm -r dot_gemini/config/skills/architecture-blueprint-generator
git rm -r dot_gemini/config/skills/architecture-patterns
git rm -r dot_gemini/config/skills/improve-codebase-architecture
git rm -r dot_gemini/config/skills/find-docs
git commit -m "refactor(gemini): prune redundant architecture and docs skills"
chezmoi apply
```
