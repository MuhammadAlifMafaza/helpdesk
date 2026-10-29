<footer class="border-t border-slate-200 bg-white">
    <div class="mx-auto max-w-7xl px-5 sm:px-8 lg:px-12">
        <div class="grid gap-8 py-10 md:grid-cols-2 md:gap-16">
            <div class="flex flex-col items-start gap-4">
                <div class="flex items-center gap-3">
                    <img src="{{ asset('branding/logo.svg') }}" alt="" class="size-10 shrink-0">
                    <div>
                        <p class="font-semibold text-iwima-blue">Helpdesk IWIMA</p>
                        <p class="mt-1 text-sm text-slate-600">Institut Widya Pratama Pekalongan</p>
                    </div>
                </div>
                <p class="max-w-sm text-sm leading-6 text-slate-600">Layanan teknis perangkat dan infrastruktur untuk mendukung kegiatan pendidikan di lingkungan kampus.</p>
            </div>
            <div>
                <h2 class="text-sm font-semibold text-ink">Hubungi kami</h2>
                <p class="mt-2 text-sm text-slate-600">Kabid Teknis dan Perawatan Infrastruktur</p>
                <address class="mt-3 text-sm leading-6 text-slate-600 not-italic">
                    Jl. Patriot No. 25, Pekalongan, Jawa Tengah
                </address>
                <dl class="mt-3 flex flex-wrap gap-x-6 gap-y-2 text-sm text-slate-600">
                    <div class="flex gap-2"><dt>Telepon</dt><dd>(0285) 427817</dd></div>
                    <div class="flex gap-2"><dt>Faks</dt><dd>(0285) 427815</dd></div>
                </dl>
            </div>
        </div>
        <p class="border-t border-slate-200 py-5 text-xs leading-5 text-slate-500">&copy; {{ date('Y') }} Institut Widya Pratama Pekalongan</p>
    </div>
</footer>
