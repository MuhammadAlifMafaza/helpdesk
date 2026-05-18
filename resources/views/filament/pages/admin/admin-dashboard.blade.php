<x-filament-panels::page>
    {{-- page content --}}

    <div class="relative min-h-screen">

        <!-- background blur -->
        <div class="fixed top-0 left-0 w-96 h-96 bg-blue-300/20 rounded-full blur-3xl -z-10"></div>
        <div class="fixed bottom-0 right-0 w-96 h-96 bg-indigo-300/20 rounded-full blur-3xl -z-10"></div>

        <!-- HEADER -->
        <div class="mb-6">

            <div class="bg-white/70 backdrop-blur-xl border border-white/40 rounded-3xl shadow-lg px-8 py-6">

                <div class="flex justify-between items-center">

                    <div>
                        <h2 class="text-2xl font-bold text-slate-800">
                            Dashboard
                        </h2>

                        <p class="text-sm text-slate-500 mt-1">
                            Welcome back, Administrator
                        </p>
                    </div>

                    <div class="flex items-center gap-4">
                        <div class="text-right">
                            <p class="font-semibold text-slate-700">
                                {{ auth()->user()->name ?? 'Admin User' }}
                            </p>

                            <p class="text-sm text-slate-500">
                                System Administrator
                            </p>
                        </div>

                        <div
                            class="w-12 h-12 rounded-2xl bg-gradient-to-r from-blue-600 to-indigo-600 flex items-center justify-center text-white font-bold shadow">
                            {{ strtoupper(substr(auth()->user()->name ?? 'A', 0, 1)) }}
                        </div>
                    </div>

                </div>

            </div>

        </div>

        <!-- STATS -->
        <div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-4 gap-6 mb-6">

            <div class="bg-white/70 backdrop-blur-xl border border-white/40 rounded-3xl p-6 shadow-lg">
                <p class="text-sm text-slate-500 mb-2">Total Tickets</p>
                <h3 class="text-3xl font-bold text-slate-800">248</h3>
            </div>

            <div class="bg-white/70 backdrop-blur-xl border border-white/40 rounded-3xl p-6 shadow-lg">
                <p class="text-sm text-slate-500 mb-2">Open Tickets</p>
                <h3 class="text-3xl font-bold text-orange-500">32</h3>
            </div>

            <div class="bg-white/70 backdrop-blur-xl border border-white/40 rounded-3xl p-6 shadow-lg">
                <p class="text-sm text-slate-500 mb-2">Resolved</p>
                <h3 class="text-3xl font-bold text-green-500">187</h3>
            </div>

            <div class="bg-white/70 backdrop-blur-xl border border-white/40 rounded-3xl p-6 shadow-lg">
                <p class="text-sm text-slate-500 mb-2">Pending</p>
                <h3 class="text-3xl font-bold text-red-500">29</h3>
            </div>

        </div>

        <!-- TABLE -->
        <div class="bg-white/70 backdrop-blur-xl border border-white/40 rounded-3xl shadow-xl p-6">

            <div class="mb-5">
                <h3 class="text-xl font-bold text-slate-800">
                    Recent Tickets
                </h3>
            </div>

            <div class="overflow-x-auto">

                <table class="w-full text-sm">

                    <thead>
                        <tr class="text-left text-slate-500 border-b border-slate-200">
                            <th class="py-4">Ticket ID</th>
                            <th class="py-4">Subject</th>
                            <th class="py-4">User</th>
                            <th class="py-4">Status</th>
                            <th class="py-4">Date</th>
                        </tr>
                    </thead>

                    <tbody class="text-slate-700">

                        <tr class="border-b border-slate-100">
                            <td class="py-4">#TK001</td>
                            <td>Cannot login to system</td>
                            <td>Mahasiswa</td>
                            <td>
                                <span class="px-3 py-1 rounded-full bg-orange-100 text-orange-600 text-xs">
                                    Open
                                </span>
                            </td>
                            <td>Today</td>
                        </tr>

                        <tr class="border-b border-slate-100">
                            <td class="py-4">#TK002</td>
                            <td>Password reset request</td>
                            <td>Dosen</td>
                            <td>
                                <span class="px-3 py-1 rounded-full bg-green-100 text-green-600 text-xs">
                                    Resolved
                                </span>
                            </td>
                            <td>Today</td>
                        </tr>

                        <tr>
                            <td class="py-4">#TK003</td>
                            <td>Access denied</td>
                            <td>Staff</td>
                            <td>
                                <span class="px-3 py-1 rounded-full bg-red-100 text-red-600 text-xs">
                                    Pending
                                </span>
                            </td>
                            <td>Yesterday</td>
                        </tr>

                    </tbody>

                </table>

            </div>

        </div>

    </div>

</x-filament-panels::page>
