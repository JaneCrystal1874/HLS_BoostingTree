-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_cGz_rom is 
    generic(
             DWIDTH     : integer := 1; 
             AWIDTH     : integer := 8; 
             MEM_SIZE    : integer := 195
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of predict_ensemble_cGz_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 => "0", 1 => "1", 2 to 4=> "0", 5 to 7=> "1", 8 => "0", 9 => "1", 10 => "0", 
    11 => "1", 12 to 16=> "0", 17 to 18=> "1", 19 to 20=> "0", 21 to 22=> "1", 23 => "0", 24 to 26=> "1", 
    27 => "0", 28 to 29=> "1", 30 to 35=> "0", 36 to 38=> "1", 39 to 40=> "0", 41 => "1", 42 to 43=> "0", 
    44 => "1", 45 to 46=> "0", 47 => "1", 48 to 49=> "0", 50 to 51=> "1", 52 => "0", 53 => "1", 
    54 => "0", 55 to 61=> "1", 62 to 63=> "0", 64 => "1", 65 => "0", 66 to 67=> "1", 68 to 70=> "0", 
    71 => "1", 72 to 77=> "0", 78 to 79=> "1", 80 to 81=> "0", 82 to 86=> "1", 87 to 88=> "0", 89 => "1", 
    90 to 91=> "0", 92 => "1", 93 => "0", 94 to 96=> "1", 97 => "0", 98 => "1", 99 => "0", 
    100 to 103=> "1", 104 to 109=> "0", 110 to 112=> "1", 113 to 115=> "0", 116 => "1", 117 => "0", 118 => "1", 
    119 => "0", 120 to 121=> "1", 122 => "0", 123 to 125=> "1", 126 to 128=> "0", 129 to 131=> "1", 132 => "0", 
    133 to 134=> "1", 135 to 138=> "0", 139 to 142=> "1", 143 => "0", 144 => "1", 145 to 146=> "0", 147 => "1", 
    148 to 149=> "0", 150 => "1", 151 to 152=> "0", 153 to 157=> "1", 158 to 161=> "0", 162 => "1", 163 to 164=> "0", 
    165 to 166=> "1", 167 => "0", 168 to 170=> "1", 171 to 174=> "0", 175 to 176=> "1", 177 => "0", 178 to 181=> "1", 
    182 to 183=> "0", 184 to 186=> "1", 187 to 194=> "0" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity predict_ensemble_cGz is
    generic (
        DataWidth : INTEGER := 1;
        AddressRange : INTEGER := 195;
        AddressWidth : INTEGER := 8);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of predict_ensemble_cGz is
    component predict_ensemble_cGz_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_cGz_rom_U :  component predict_ensemble_cGz_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


