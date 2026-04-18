/* ═══════════════════════════════════════════════════
   Linux Hacker's Bible — app.js
   UI logic: search, filter, render, category pills
   ═══════════════════════════════════════════════════ */

/* Derive sorted unique categories from COMMANDS */
const CATS = [...new Set(COMMANDS.map(c => c[1]))].sort();

let activeCat = '';

/* ── Helpers ──────────────────────────────────────── */

/**
 * Highlight all occurrences of query string inside text.
 * Returns original text when query is empty.
 */
function highlight(text, q) {
  if (!q) return text;
  const escaped = q.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
  return text.replace(new RegExp('(' + escaped + ')', 'gi'), '<mark>$1</mark>');
}

/* ── Build UI ─────────────────────────────────────── */

/**
 * Populate category dropdown and pill buttons.
 * Also sets the total command count in the header stat chip.
 */
function buildUI() {
  const sel   = document.getElementById('catFilter');
  const pills = document.getElementById('catPills');

  CATS.forEach(cat => {
    /* Dropdown option */
    const opt = document.createElement('option');
    opt.value       = cat;
    opt.textContent = cat;
    sel.appendChild(opt);

    /* Pill button */
    const st   = CAT_STYLE[cat] || { bg: '#111', col: '#aaa', border: '#222' };
    const pill = document.createElement('span');
    pill.className   = 'pill';
    pill.textContent = cat;
    pill.id          = 'pill-' + cat;
    pill.style.cssText = `background:${st.bg};color:${st.col};border-color:${st.border};`;
    pill.addEventListener('click', () => {
      activeCat = (activeCat === cat) ? '' : cat;
      document.getElementById('catFilter').value = activeCat;
      syncPills();
      filterTable();
    });
    pills.appendChild(pill);
  });

  document.getElementById('totalCount').textContent = COMMANDS.length;
}

/**
 * Sync pill active state to the current activeCat value.
 */
function syncPills() {
  CATS.forEach(cat => {
    const pill = document.getElementById('pill-' + cat);
    if (!pill) return;
    const st = CAT_STYLE[cat] || { border: '#222', col: '#aaa' };
    if (activeCat === cat) {
      pill.classList.add('active');
      pill.style.borderColor = st.col;
    } else {
      pill.classList.remove('active');
      pill.style.borderColor = st.border;
    }
  });
}

/* ── Filter & Render ──────────────────────────────── */

/**
 * Filter COMMANDS by active category and search query,
 * then render matching rows into the table body.
 */
function filterTable() {
  const q   = document.getElementById('searchInput').value.toLowerCase().trim();
  const cat = activeCat || document.getElementById('catFilter').value;

  const tbody    = document.getElementById('tableBody');
  const noResult = document.getElementById('noResults');
  tbody.innerHTML = '';

  let count = 0;

  COMMANDS.forEach(([cmd, category, desc, usage]) => {
    /* Category filter */
    if (cat && category !== cat) return;

    /* Search filter — matches any column */
    if (q) {
      const haystack = [cmd, category, desc, usage].join(' ').toLowerCase();
      if (!haystack.includes(q)) return;
    }

    count++;

    const st = CAT_STYLE[category] || { bg: '#111', col: '#aaa', border: '#222' };
    const tr = document.createElement('tr');

    tr.innerHTML = `
      <td>
        <span class="cmd-text">${highlight(cmd, q)}</span>
      </td>
      <td>
        <span class="cat-badge"
          style="background:${st.bg};color:${st.col};border:1px solid ${st.border};">
          ${category}
        </span>
      </td>
      <td>
        <span class="desc-text">${highlight(desc, q)}</span>
      </td>
      <td>
        <span class="usage-text">${usage}</span>
      </td>
    `;

    tbody.appendChild(tr);
  });

  /* Update result counter */
  document.getElementById('resultCount').innerHTML =
    `<strong>${count}</strong> / ${COMMANDS.length}`;

  /* Show/hide empty state */
  noResult.style.display = count === 0 ? 'block' : 'none';
}

/* ── Event Handlers ───────────────────────────────── */

/** Called when the user changes the category dropdown. */
function onCatSelect() {
  activeCat = document.getElementById('catFilter').value;
  syncPills();
  filterTable();
}

/* ── Init ─────────────────────────────────────────── */
document.addEventListener('DOMContentLoaded', () => {
  buildUI();
  filterTable();
});
