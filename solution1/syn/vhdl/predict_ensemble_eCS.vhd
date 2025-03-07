-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity predict_ensemble_eCS_rom is 
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


architecture rtl of predict_ensemble_eCS_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 2=> "0", 3 => "1", 4 => "0", 5 to 6=> "1", 7 to 9=> "0", 10 => "1", 11 => "0", 
    12 to 13=> "1", 14 to 15=> "0", 16 => "1", 17 to 21=> "0", 22 => "1", 23 to 24=> "0", 25 => "1", 
    26 to 29=> "0", 30 => "1", 31 to 35=> "0", 36 => "1", 37 to 41=> "0", 42 => "1", 43 => "0", 
    44 to 46=> "1", 47 => "0", 48 => "1", 49 => "0", 50 => "1", 51 to 52=> "0", 53 to 57=> "1", 
    58 => "0", 59 => "1", 60 => "0", 61 to 69=> "1", 70 to 73=> "0", 74 to 75=> "1", 76 to 78=> "0", 
    79 to 81=> "1", 82 to 84=> "0", 85 => "1", 86 => "0", 87 to 89=> "1", 90 => "0", 91 to 92=> "1", 
    93 => "0", 94 => "1", 95 to 98=> "0", 99 to 100=> "1", 101 to 102=> "0", 103 => "1", 104 => "0", 
    105 => "1", 106 => "0", 107 to 109=> "1", 110 to 111=> "0", 112 => "1", 113 => "0", 114 to 116=> "1", 
    117 to 123=> "0", 124 to 126=> "1", 127 to 129=> "0", 130 => "1", 131 => "0", 132 => "1", 133 to 135=> "0", 
    136 to 137=> "1", 138 => "0", 139 to 141=> "1", 142 => "0", 143 => "1", 144 => "0", 145 => "1", 
    146 => "0", 147 to 149=> "1", 150 => "0", 151 to 153=> "1", 154 => "0", 155 => "1", 156 to 157=> "0", 
    158 => "1", 159 => "0", 160 => "1", 161 to 162=> "0", 163 => "1", 164 => "0", 165 to 170=> "1", 
    171 => "0", 172 => "1", 173 => "0", 174 => "1", 175 => "0", 176 to 177=> "1", 178 to 179=> "0", 
    180 to 186=> "1", 187 to 194=> "0" );

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

entity predict_ensemble_eCS is
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

architecture arch of predict_ensemble_eCS is
    component predict_ensemble_eCS_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    predict_ensemble_eCS_rom_U :  component predict_ensemble_eCS_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


