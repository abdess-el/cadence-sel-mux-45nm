# رفع المشروع إلى GitHub / Uploading to GitHub

اختر طريقة واحدة من الثلاث. الأسهل هي الطريقة 1.

## قبل البدء (مهم)

1. افتح `LICENSE` واستبدل `Abdessamad El Omary` باسمك (أو استخدم `publish.sh` فهو يفعل ذلك تلقائياً).
2. راجع [KNOWN_ISSUES.md](KNOWN_ISSUES.md)، خصوصاً **عدم تطابق gpdk090 / gpdk045** وفقرة **الخصوصية** (أرقام جامعية في اللقطات واسمك في بيانات الـPDF).
3. لديك حساب على <https://github.com/signup>.

---

## الطريقة 1: من المتصفح (بدون أي برامج)

1. افتح <https://github.com/new>.
2. **Repository name:** `cadence-sel-mux-45nm` · **Public** · **لا** تفعّل Add README / .gitignore / license (المشروع يحتوي عليها).
3. اضغط **Create repository**.
4. في الصفحة التالية اضغط **uploading an existing file**.
5. افتح المجلد بعد فك الضغط، حدّد **كل محتوياته** (`README.md`, `docs`, `images`, `LICENSE`…) واسحبها إلى الصفحة. السحب يحافظ على المجلدات.
6. اكتب رسالة الـcommit، مثلاً: `Initial commit`، ثم **Commit changes**.

حدود الرفع من المتصفح: 100 ملف لكل دفعة، و25MB لكل ملف. المشروع فيه نحو 45 ملفاً وأكبرها أقل من 2MB، فيكفي.
الملفان `.gitignore` و`.gitattributes` ملفان مخفيان؛ إن لم يظهرا عند التحديد فارفعهما لاحقاً بـ **Add file → Upload files** أو اتركهما.

---

## الطريقة 2: سكربت واحد (Git)

ثبّت Git من <https://git-scm.com/downloads> ثم داخل المجلد:

```bash
bash publish.sh
```

يسألك عن اسمك واسم مستخدم GitHub، ثم يملأ الرخصة وينشئ المستودع ويرفعه.
إن كان [GitHub CLI](https://cli.github.com) مثبتاً ومسجّلاً (`gh auth login`) يُنشأ المستودع تلقائياً؛ وإلا فأنشئ مستودعاً **فارغاً** من <https://github.com/new> حين يطلب منك ذلك.

عند `git push` سيطلب GitHub تسجيل الدخول: كلمة المرور العادية لا تعمل، استخدم **Personal Access Token** من
<https://github.com/settings/tokens> (صلاحية `repo`) بدل كلمة المرور، أو فعّل SSH.

---

## الطريقة 3: أوامر Git يدوياً

```bash
cd cadence-sel-mux-45nm
sed -i 's/Abdessamad El Omary/اسمك/' LICENSE      # على macOS: sed -i '' ...
git init -b main
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/abdess-el/cadence-sel-mux-45nm.git
git push -u origin main
```

---

## بعد الرفع

- **About** (الترس بجانب اسم المستودع): ضع الوصف  
  `Hierarchical CMOS logic cell in Cadence Virtuoso (45nm): schematic, symbol, layout, Assura DRC/LVS`
- **Topics** المقترحة: `cadence-virtuoso` `vlsi` `ic-design` `cmos` `layout` `drc` `lvs` `analog-ic` `eda` `gpdk045`
- تأكد أن الصور ظاهرة في صفحة README (إن لم تظهر فتحقق أن مجلد `images/` رُفع بنفس الهيكل).
- لاحقاً، لإضافة تعديل: `git add . && git commit -m "..." && git push`.
